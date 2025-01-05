// import 'package:chewie/chewie.dart';
// import 'package:film_time/feature/detail_screen/detail_screen.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:video_player/video_player.dart';

// import 'package:webview_flutter/webview_flutter.dart';

// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget({super.key, required this.items});
//   final ItemsEntity items;

//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   // late VideoPlayerController _videoPlayerController;
//   // late ChewieController _chewieController;
//   late FlickManager flickManager;
//   @override
//   void initState() {
//     print(widget.items.embed.toString());

//     super.initState();

//     flickManager = FlickManager(
//       autoPlay: true,
//       autoInitialize: true,
//       videoPlayerController: VideoPlayerController.networkUrl(
//         Uri.parse(
//             // widget.items.embed.toString(),
//             'https://s4.phim1280.tv/20241225/IPDr6lt5/index.m3u8'
//             // 'https://player.phimapi.com/player/?url=https://s4.phim1280.tv/20241225/IPDr6lt5/index.m3u8'
//             // 'https://s2.phim1280.tv/20230907/LbMzd3di/index.m3u8',
//             ),
//       ),
//     );

//     // _videoPlayerController = VideoPlayerController.networkUrl(
//     //   Uri.parse(
//     //     widget.items.embed.toString(),
//     //     // 'https://www.youtube.com/watch?v=0c23odyAUdg',
//     //   ),
//     // );
//     // _chewieController = ChewieController(
//     //   autoPlay: true,
//     //   autoInitialize: true,
//     //   videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
//     //     widget.items.embed.toString(),
//     //     // 'https://embed.streamc.xyz/embed.php?hash=30fa9e72a99c1cb3dabdf8a2e4222061.m3u8',
//     //   )),
//     //   aspectRatio: 16 / 9,
//     // );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // _videoPlayerController.dispose();
//     flickManager.dispose();
//     // _chewieController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Tập ${widget.items.name.toString()}'),
//         ),
//         body: SizedBox(
//             height: 200,
//             child: WebViewPlayer(url: widget.items.embed.toString()))
//         //  SizedBox(
//         //   height: 200,
//         //   child: FlickVideoPlayer(
//         //     wakelockEnabled: true,
//         //     flickManager: flickManager,
//         //     flickVideoWithControls: FlickVideoWithControls(
//         //       aspectRatioWhenLoading: 16 / 9,
//         //       videoFit: BoxFit.fill,
//         //       controls: FlickPortraitControls(
//         //         iconSize: 40,
//         //         progressBarSettings: FlickProgressBarSettings(
//         //           playedColor: Colors.blue,
//         //         ),
//         //       ),
//         //       // playerLoadingFallback: const CircularProgressIndicator(),
//         //     ),
//         //   ),
//         // ),

//         // Container(
//         // child: AspectRatio(
//         // aspectRatio: 16 / 9,
//         // // child: Chewie(controller: _chewieController),
//         // // ),
//         // ),
//         );
//   }
// }

// class WebViewPlayer extends StatefulWidget {
//   final String url;

//   const WebViewPlayer({Key? key, required this.url}) : super(key: key);

//   @override
//   State<WebViewPlayer> createState() => _WebViewPlayerState();
// }

// class _WebViewPlayerState extends State<WebViewPlayer> {
//   late WebViewController _controller = WebViewController();

//   @override
//   void initState() async {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onHttpError: (HttpResponseError error) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.clearCache();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(controller: _controller);
//   }
// }
