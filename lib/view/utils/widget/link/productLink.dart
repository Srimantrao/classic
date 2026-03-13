// ignore_for_file: strict_top_level_inference

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Widget productLink(link) {
  return dimaondlink(link);
}

Widget dimaondlink(String? dimaondlink) {
  if (dimaondlink == null || dimaondlink.isEmpty) {
    return Center(
      child: Text('Link not available', style: TextStyle(fontSize: 16)),
    );
  }
  Future.delayed(Duration.zero, () {
    _openInChrome(dimaondlink);
  });
  return SizedBox();
}

Future<void> _openInChrome(String url) async {
  final uri = Uri.parse(url);
  try {
    final chromeUri = Uri.parse('googlechrome://navigate?url=$url');
    if (await canLaunchUrl(chromeUri)) {
      await launchUrl(chromeUri);
    } else {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
