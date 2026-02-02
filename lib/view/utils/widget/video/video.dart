// ignore_for_file: deprecated_member_use

import 'package:classic/view/utils/widget/video/videoWidet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:video_player/video_player.dart';
import '../../../../controller/user_Interface/widget/video/video_Controller.dart';

class Video extends StatelessWidget {
  final String videoUrl;
  const Video({super.key, required this.videoUrl});
  @override
  Widget build(BuildContext context) {
    final VideoController c = Get.put(VideoController(), tag: videoUrl);
    c.initializeVideo(videoUrl);
    return GetBuilder<VideoController>(
      tag: videoUrl,
      builder: (controller) {
        if (controller.videoPlayerController == null ||
            !controller.videoPlayerController!.value.isInitialized) {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return AspectRatio(
          aspectRatio: controller.videoPlayerController!.value.aspectRatio,
          child: Stack(
            children: [
              /// VIDEO
              VideoPlayer(controller.videoPlayerController!),

              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),

              /// DARK OVERLAY
              Obx(
                () => controller.showControls.value
                    ? Container(color: Colors.black.withOpacity(0.3))
                    : const SizedBox(),
              ),

              /// TAP TO SHOW CONTROLS
              Positioned.fill(
                child: GestureDetector(
                  onTap: controller.toggleControls,
                  behavior: HitTestBehavior.opaque,
                ),
              ),

              /// CENTER PLAY / PAUSE
              Obx(
                () => controller.showControls.value
                    ? Center(child: playAndPause(controller))
                    : const SizedBox(),
              ),

              /// BOTTOM CONTROLS
              Obx(
                () => controller.showControls.value
                    ? bottomControls(controller)
                    : const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}
