import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSeparatorWidget extends StatefulWidget {
  final String videoUrl;

  const VideoSeparatorWidget({
    super.key,
    required this.videoUrl,
  });

  @override
  State<VideoSeparatorWidget> createState() => _VideoSeparatorWidgetState();
}

class _VideoSeparatorWidgetState extends State<VideoSeparatorWidget> {
  late VideoPlayerController _controller;
  bool showPlayButton = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        /// Reset UI when video finishes
        setState(() {
          showPlayButton = true;
          _controller.pause();
          _controller.seekTo(Duration.zero);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handlePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      setState(() => showPlayButton = true);
    } else {
      _controller.play();
      setState(() => showPlayButton = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.isInitialized
              ? _controller.value.aspectRatio
              : 16 / 9,
          child: Stack(
            children: [
              /// Video Player
              _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(child: CircularProgressIndicator()),

              /// Play/Pause Button
              if (showPlayButton)
                Center(
                  child: IconButton(
                    iconSize: 55,
                    icon: const Icon(Icons.play_circle_fill),
                    color: Colors.white,
                    onPressed: handlePlayPause,
                  ),
                ),

              /// Tap anywhere to toggle
              Positioned.fill(
                child: GestureDetector(
                  onTap: handlePlayPause,
                  child: Container(color: Colors.transparent),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        const Divider(
          thickness: 1.2,
          color: Colors.grey,
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}