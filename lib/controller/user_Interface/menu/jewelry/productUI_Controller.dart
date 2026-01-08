// ignore_for_file: avoid_print, unnecessary_import, file_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';

class ProductAPICall extends GetxController {
  ProductAPICall({
    required this.categoryId,
    this.subCategoryId,
    this.metalType,
    this.metalStamp,
    this.shape,
    this.settingType,
    this.minPrice,
    this.priceShort,
  });

  final String categoryId;
  final String? subCategoryId;
  final String? metalType;
  final String? metalStamp;
  final String? shape;
  final String? settingType;
  final String? minPrice;
  final String? priceShort;

  final ProductlistController productListAPI = Get.find<ProductlistController>();

  @override
  void onInit() {
    super.onInit();

    productListAPI.fetchFirstPage(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      metalType: metalType,
      metalStamp: metalStamp,
      shape: shape,
      settingType: settingType,
      minPrice: minPrice,
      priceShort: priceShort,
    );
  }

  /// Pagination trigger (call from UI)
  void loadNextPage() {
    productListAPI.fetchNextPage(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      metalType: metalType,
      metalStamp: metalStamp,
      shape: shape,
      settingType: settingType,
      minPrice: minPrice,
      priceShort: priceShort,
    );
  }
}

class ProductSerchController extends GetxController {
  final productListAPI = Get.put(ProductlistController());
  final RxString searchQuery = ''.obs;

  final RxList<Map<String, dynamic>> filteredProducts =
      <Map<String, dynamic>>[].obs;

  final RxBool isLoading = false.obs;
  final RxBool isLoadMore = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// ✅ Initial safe assignment
    _syncFromApi();

    /// Listen to search changes
    ever(searchQuery, (_) => _applySearch());

    /// Listen to API list changes (pagination / reload)
    ever(productListAPI.productListData, (_) => _applySearch());
  }

  /// 🔄 Sync API → Search list
  void _syncFromApi() {
    filteredProducts.assignAll(
      productListAPI.productListData.whereType<Map<String, dynamic>>().toList(),
    );
  }

  /// 🔍 Main search logic
  void _applySearch() {
    final query = searchQuery.value.trim().toLowerCase();

    final allProducts = productListAPI.productListData
        .whereType<Map<String, dynamic>>()
        .toList();

    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
      return;
    }

    filteredProducts.assignAll(
      allProducts.where((product) {
        final title = product['productTitle']?.toString().toLowerCase() ?? '';
        final code = product['itemCode']?.toString().toLowerCase() ?? '';
        return title.contains(query) || code.contains(query);
      }).toList(),
    );
  }

  /// Call from UI
  void onSearchChanged(String value) {
    searchQuery.value = value;
  }
}

class ProductuiController extends GetxController {
  // Reactive variables
  final RxMap<String, String> selectedVariants = <String, String>{}.obs;
  final Map<String, String> selectedShapes = <String, String>{}.obs;
  final RxList<Map<String, dynamic>> childProducts =
      <Map<String, dynamic>>[].obs;
  final RxString selectedSlug = ''.obs;
  final RxList<Map<String, dynamic>> activeVariant =
      <Map<String, dynamic>>[].obs;

  final String productId;
  final List<Map<String, dynamic>> initialChildProducts;

  ProductuiController._(this.productId, this.initialChildProducts);

  factory ProductuiController({
    required String productId,
    List<Map<String, dynamic>>? initialChildProducts,
  }) {
    return ProductuiController._(
      productId,
      initialChildProducts ?? <Map<String, dynamic>>[],
    );
  }

  @override
  void onInit() {
    super.onInit();
    childProducts.assignAll(initialChildProducts);
    _initializeSelectedSlug();
    _updateActiveVariant();
    print('[$productId] childProducts count: ${initialChildProducts.length}');
  }

  // Initialize selected slug
  void _initializeSelectedSlug() {
    if (selectedVariants.containsKey(productId) &&
        selectedVariants[productId]!.isNotEmpty) {
      selectedSlug.value = selectedVariants[productId]!;
    } else if (childProducts.isNotEmpty) {
      selectedSlug.value = childProducts[0]['slug'] ?? '';
      selectedVariants[productId] = selectedSlug.value;
    }
  }

  // Update active variant based on selected slug
  void _updateActiveVariant() {
    if (childProducts.isEmpty) {
      activeVariant.clear();
      return;
    }

    final selected = childProducts.firstWhere(
      (item) => item['slug'] == selectedSlug.value,
      orElse: () => {},
    );

    if (selected.isNotEmpty) {
      activeVariant.value = [selected];
    } else {
      // Fallback to first variant
      activeVariant.value = [childProducts[0]];
      selectedSlug.value = childProducts[0]['slug'] ?? '';
      selectedVariants[productId] = selectedSlug.value;
    }
  }

  // Getter for images
  List get images =>
      activeVariant.isNotEmpty ? activeVariant[0]['images'] ?? [] : [];

  // Getter for product title
  String get productTitle =>
      activeVariant.isNotEmpty ? activeVariant[0]['productTitle'] ?? '' : '';

  // Getter for final price
  double get finalPrice => activeVariant.isNotEmpty
      ? (activeVariant[0]['finalPrice']?.toDouble() ?? 0.0)
      : 0.0;

  // Getter for formatted price
  String get formattedPrice => finalPrice.toStringAsFixed(2);

  // Get unique shape names
  List<Map<String, dynamic>> get uniqueShapeList {
    final List<Map<String, dynamic>> shapeList = [];
    final Set<String> added = {};

    for (final item in childProducts) {
      final List stoneDetails = item['stoneDetails'] ?? [];
      for (final stone in stoneDetails) {
        final shape = stone['shape'];
        if (shape != null && shape['paraMtrName'] != null) {
          final name = shape['paraMtrName'];
          if (!added.contains(name)) {
            added.add(name);
            shapeList.add({'shapeId': shape['_id'], 'shapeName': name});
          }
        }
      }
    }

    return shapeList;
  }

  // Method to handle shape selection
  void selectShape(String? shapeId) {
    if (shapeId == null || shapeId.isEmpty) return;

    final isCurrentlySelected = selectedShapes[productId] == shapeId;

    if (isCurrentlySelected) {
      // Deselect shape
      selectedShapes.remove(productId);

      // Reset to first variant
      if (childProducts.isNotEmpty) {
        selectedVariants[productId] = childProducts[0]['slug'] ?? '';
      }
    } else {
      // Select new shape
      selectedShapes[productId] = shapeId;

      // Find first variant with this shape
      final matchingVariant = childProducts.firstWhere((item) {
        final stoneDetails = item['stoneDetails'] ?? [];
        return stoneDetails.any((stone) {
          final shapeData = stone['shape'];
          return shapeData != null && shapeData['_id'] == shapeId;
        });
      }, orElse: () => childProducts.isNotEmpty ? childProducts[0] : {});

      if (matchingVariant.isNotEmpty && matchingVariant['slug'] != null) {
        selectedVariants[productId] = matchingVariant['slug'];
      }
    }
  }

  // Check if a shape is selected
  bool isShapeSelected(String shapeId) {
    return selectedShapes[productId] == shapeId;
  }

  //combinedMetal
  List<Map<String, dynamic>> get combinedMetal {
    final result = <Map<String, dynamic>>[];

    for (final item in childProducts) {
      final metalStamps = (item['metalStamp'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      final metalTypes = (item['metalType'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      final String itemSlug = item['slug'] ?? '';

      for (final stamp in metalStamps) {
        for (final metal in metalTypes) {
          final stampName = stamp['paraMtrName'] ?? '';
          final metalName = metal['metal'] ?? '';

          result.add({
            'slug': itemSlug,
            'metalStampId': stamp['_id'] ?? '',
            'metalTypeId': metal['_id'] ?? '',
            'combinedMetalName': stampName.isNotEmpty && metalName.isNotEmpty
                ? '$stampName $metalName'
                : stampName + metalName,
            'param': stampName,
          });
        }
      }
    }

    return result;
  }

  // Helper to get background color based on metal name
  Color getMetalBackgroundColor(String metalName) {
    if (metalName.contains('White')) {
      return Colors.grey.shade300;
    } else if (metalName.contains('Rose')) {
      return Colors.pink.shade200;
    } else if (metalName.contains('Yellow')) {
      return Colors.yellow.shade200;
    }
    return Colors.white;
  }

  // Check if a variant is selected
  bool isVariantSelected(String variantSlug) {
    return selectedSlug.value == variantSlug;
  }

  // Get carat options
  List<Map<String, dynamic>> get caratOptions {
    final result = <Map<String, dynamic>>[];
    final addedIds = <String>{};

    for (final child in childProducts) {
      final metalStamps = (child['metalStamp'] as List? ?? [])
          .cast<Map<String, dynamic>>();

      for (final stamp in metalStamps) {
        final id = stamp['_id'] ?? '';
        if (!addedIds.contains(id)) {
          addedIds.add(id);
          result.add({
            'carat': stamp['slug'] ?? stamp['paraMtrName'] ?? '',
            'caratId': id,
          });
        }
      }
    }

    return result;
  }

  // Get filtered variants based on selected shape
  List<Map<String, dynamic>> get filteredVariants {
    if (selectedShapes[productId] == null) {
      return childProducts;
    }

    final selectedShapeId = selectedShapes[productId]!;
    final filtered = childProducts.where((variant) {
      final stoneDetails = variant['stoneDetails'] ?? [];
      return stoneDetails.any((stone) {
        final shape = stone['shape'];
        return shape != null && shape['_id'] == selectedShapeId;
      });
    }).toList();

    return filtered.isNotEmpty ? filtered : childProducts;
  }

  // Get weight options with their associated slugs
  Map<String, List<String>> get weightOptions {
    final Map<String, List<String>> options = {};

    for (final item in filteredVariants) {
      final wgt = item['totalWgt']?.toString();
      final slug = item['slug']?.toString();

      if (wgt != null && slug != null && slug.isNotEmpty) {
        if (!options.containsKey(wgt)) {
          options[wgt] = [];
        }
        if (!options[wgt]!.contains(slug)) {
          options[wgt]!.add(slug);
        }
      }
    }

    return options;
  }

  // Get sorted weight list
  List<String> get sortedWeightList {
    final weights = weightOptions.keys.toList();
    // Sort numerically if possible, otherwise alphabetically
    weights.sort((a, b) {
      try {
        final doubleA = double.tryParse(a);
        final doubleB = double.tryParse(b);
        if (doubleA != null && doubleB != null) {
          return doubleA.compareTo(doubleB);
        }
      } catch (_) {}
      return a.compareTo(b);
    });
    return weights;
  }

  // Check if a weight is selected
  bool isWeightSelected(String weight) {
    final slugs = weightOptions[weight] ?? [];
    return slugs.contains(selectedSlug.value);
  }

  // Select variant by weight
  void selectByWeight(String weight) {
    final slugs = weightOptions[weight];
    if (slugs != null && slugs.isNotEmpty) {
      selectVariant(slugs[0]);
    }
  }

  // Handle variant selection
  void selectVariant(String slug) {
    selectedSlug.value = slug;
    selectedVariants[productId] = slug;
    _updateActiveVariant();

    // Optional: Add haptic feedback
    // HapticFeedback.lightImpact();
  }

  // Update child products and refresh state
  void updateChildProducts(List<Map<String, dynamic>> products) {
    childProducts.value = products;
    _initializeSelectedSlug();
    _updateActiveVariant();
  }

  // Check if variant data is available
  bool get hasVariantData =>
      childProducts.isNotEmpty && activeVariant.isNotEmpty;
}
