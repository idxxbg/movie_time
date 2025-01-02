import 'package:chewie/chewie.dart';
import 'package:film_time/feature/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.items});
  final ItemsEntity items;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    print(widget.items.embed.toString());
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.items.embed.toString(),
        // 'https://www.youtube.com/watch?v=0c23odyAUdg',
      ),
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tập ${widget.items.name.toString()}'),
        ),
        body: Container(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(controller: _chewieController),
          ),
        ));
  }
}
