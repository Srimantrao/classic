// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, avoid_single_cascade_in_expression_statements

import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoPlayerController;

  final RxBool showControls = false.obs;
  Timer? _hideTimer;

  /// Initialize video safely
  Future<void> initializeVideo(String videoUrl) async {
    if (videoPlayerController != null) return;

    videoPlayerController = VideoPlayerController.asset(videoUrl);
    await videoPlayerController!.initialize();
    await videoPlayerController!.setVolume(0.0);

    videoPlayerController!..pause()
    ..setLooping(true)
    ..play();

    update();
  }

  /// Play / Pause
  void togglePlayPause() {
    if (videoPlayerController == null) return;

    if (videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
      showControls.value = true;
      _cancelAutoHide();
    } else {
      videoPlayerController!.play();
      _startAutoHide();
    }
    update();
  }

  /// Show controls + auto hide
  void toggleControls() {
    showControls.value = !showControls.value;

    if (showControls.value) {
      _startAutoHide();
    } else {
      _cancelAutoHide();
    }
  }

  /// Auto hide after 3 seconds
  void _startAutoHide() {
    _cancelAutoHide();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      showControls.value = false;
    });
  }

  void _cancelAutoHide() {
    _hideTimer?.cancel();
    _hideTimer = null;
  }

  /// Duration formatter
  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    _cancelAutoHide();
    videoPlayerController?.dispose();
    super.onClose();
  }
}
