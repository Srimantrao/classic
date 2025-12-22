// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullscreenVideo extends StatelessWidget {
  final VideoPlayerController controller;
  const FullscreenVideo({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
