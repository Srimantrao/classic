import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String videoUrl;

  const Video({
    super.key,
    required this.videoUrl,
  });

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  bool showPlayButton = false; // autoplay → hide play button

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
        showPlayButton = false;
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // This will not run now because LOOPING keeps it playing
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
    return AspectRatio(
      aspectRatio:
      _controller.value.isInitialized ? _controller.value.aspectRatio : 16 / 9,
      child: Stack(
        children: [
          /// VIDEO
          _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : const Center(child: CircularProgressIndicator()),

          /// BLACK OPACITY OVERLAY
          Container(
            color: Colors.black.withOpacity(0.3), // adjust opacity here
          ),

          /// PLAY BUTTON
          if (showPlayButton)
            Center(
              child: IconButton(
                iconSize: 55,
                icon: const Icon(Icons.play_circle_fill),
                color: Colors.white,
                onPressed: handlePlayPause,
              ),
            ),

          /// TAP TO PLAY/PAUSE
          Positioned.fill(
            child: GestureDetector(
              onTap: handlePlayPause,
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}