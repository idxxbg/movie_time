import 'package:chewie/chewie.dart';
import 'package:film_time/feature/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.data});
  final ServerDataEntity? data;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayer;
  late ChewieController _chewie;

  @override
  void initState() {
    super.initState();
    _videoPlayer = VideoPlayerController.networkUrl(
        Uri.parse(widget.data!.linkM3u8.toString()));

    _chewie = ChewieController(
      videoPlayerController: _videoPlayer,
      autoPlay: true,
      aspectRatio: 16 / 9,
      // cupertinoProgressColors: ChewieProgressColors(backsgroundColor: )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayer.dispose();
    _chewie.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: SizedBox(
          child: Theme(
              data: ThemeData(
                platform: TargetPlatform.iOS,
              ),
              child:
                  //  Chewie(controller: _chewie),
                  Chewie(controller: _chewie)),
        ),
      ),
    );
  }
}

// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget({super.key, required this.items});
//   final ServerDataEntity items;

//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   // late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;
//   // late FlickManager flickManager;
//   @override
//   void initState() {
//     print(widget.items.filename.toString());

//     super.initState();

//     // flickManager = FlickManager(
//     //   autoPlay: true,
//     //   autoInitialize: true,
//     //   videoPlayerController: VideoPlayerController.networkUrl(
//     //     Uri.parse(
//     //       widget.items.linkM3u8.toString(),
//     //     ),
//     //   ),
//     // );

//     // _videoPlayerController = VideoPlayerController.networkUrl(
//     //   Uri.parse(
//     //     widget.items.linkM3u8.toString(),
//     //     // 'https://www.youtube.com/watch?v=0c23odyAUdg',
//     //   ),
//     // );
//     _chewieController = ChewieController(
//       zoomAndPan: true,
//       autoPlay: true,
//       autoInitialize: true,
//       videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
//         widget.items.linkM3u8.toString(),
//       )),
//       aspectRatio: 16 / 9,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // _videoPlayerController.dispose();
//     // flickManager.dispose();
//     _chewieController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: Text('Tập ${widget.items.name}'),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Theme(
//                   data: ThemeData(platform: TargetPlatform.iOS),
//                   child: Chewie(controller: _chewieController)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
