// ignore_for_file: file_names, strict_top_level_inference, deprecated_member_use

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/video/fullScreenvideo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

/// CENTER PLAY / PAUSE
Widget playAndPause(c) {
  return Center(
    child: AnimatedOpacity(
      opacity: c.showControls.value ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: IconButton(
        iconSize: 65,
        color: Colors.white,
        icon: Icon(
          c.videoPlayerController.value.isPlaying
              ? Icons.pause_circle_filled
              : Icons.play_circle_filled,
        ),
        onPressed: c.togglePlayPause,
      ),
    ),
  );
}

/// BOTTOM CONTROLS
Widget bottomControls(c) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: EdgeInsets.all(8),
      color: Colors.black.withOpacity(0.6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // This progress indicator already listens to the controller, so it's fine.
          VideoProgressIndicator(
            c.videoPlayerController,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: AppColor.gray5,
              bufferedColor: Colors.white54,
              backgroundColor: Colors.white24,
            ),
          ),
          SizedBox(height: Get.height * 0.006),
          Row(
            children: [
              // This also rebuilds correctly because it's based on isPlaying
              ValueListenableBuilder(
                valueListenable: c.videoPlayerController,
                builder: (context, VideoPlayerValue value, child) {
                  return IconButton(
                    icon: Icon(
                      value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: c.togglePlayPause,
                  );
                },
              ),

              ValueListenableBuilder(
                valueListenable: c.videoPlayerController,
                builder: (context, VideoPlayerValue value, child) {
                  // This builder will now run every time the video position changes
                  return Row(
                    children: [
                      Text(
                        c.formatDuration(value.position),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(" / ", style: TextStyle(color: Colors.white)),
                      Text(
                        c.formatDuration(value.duration),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  );
                },
              ),

              Spacer(),
              IconButton(
                icon: Icon(Icons.fullscreen, color: Colors.white),
                onPressed: () {
                  // Ensure the controller passed is the notifier itself
                  Get.to(
                    () => FullscreenVideo(controller: c.videoPlayerController),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
