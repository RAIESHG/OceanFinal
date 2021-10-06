import 'package:flutter/material.dart';

// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController _controller;
//   double duration = 0.0;
//   bool _showPlay = true;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://firebasestorage.googleapis.com/v0/b/utsav-ghimire.appspot.com/o/Screenrecorder-2020-07-24-21-25-34-31.mp4?alt=media&token=a68cc1a8-502c-43ec-a4ca-ff5bca111dc4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: true
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       _showPlay = _showPlay ? false : true;
//                     });
//                   },
//                   child: Stack(
//                     children: <Widget>[
//                       VideoPlayer(_controller),
//                       Positioned(
//                         bottom: 50.0,
//                         child: Container(
//                           alignment: Alignment.bottomCenter,
//                           color: Colors.transparent,
//                           child: ValueListenableBuilder(
//                               valueListenable: _controller,
//                               builder:
//                                   (context, VideoPlayerValue vlaue, child) {
//                                 return Slider(
//                                   min: 0.0,
//                                   max: vlaue.duration.inSeconds.toDouble(),
//
//                                   // valueColor: AlwaysStoppedAnimation(Colors.red),
//                                   // backgroundColor: Colors.white,
//                                   autofocus: true,
//                                   onChanged: (dur) {
//                                     setState(() {
//                                       print(dur);
//                                       print(vlaue.position);
//                                       _controller.seekTo(
//                                         Duration(
//                                           seconds:
//                                               (vlaue.duration.inSeconds * dur)
//                                                   .toInt(),
//                                         ),
//                                       );
//                                     });
//                                   },
//                                   value: vlaue.position.inSeconds /
//                                       vlaue.duration.inSeconds,
//                                 );
//                               }),
//                         ),
//                       ),
//                       _showPlay
//                           ? ValueListenableBuilder(
//                               valueListenable: _controller,
//                               builder:
//                                   (context, VideoPlayerValue value, child) {
//                                 return Container(
//                                   alignment: Alignment.center,
//                                   color: Colors.transparent,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       IconButton(
//                                           icon: Icon(
//                                             _controller.value.isPlaying
//                                                 ? Icons.pause
//                                                 : Icons.play_arrow,
//                                             color: Colors.white,
//                                             size: 30.0,
//                                           ),
//                                           onPressed: () {
//                                             //
//                                             setState(() {
//                                               value.isPlaying
//                                                   ? _controller.pause()
//                                                   : _controller.play();
//                                               print(value.position);
//                                               print(value.duration);
//                                               if (value.position.inSeconds ==
//                                                   value.duration.inSeconds) {
//                                                 _controller.seekTo(
//                                                   Duration(seconds: 0),
//                                                 );
//                                               }
//                                             });
//                                           }),
//                                       Text(
//                                         "${_formatDuration(value.position)} / ${_formatDuration(value.duration)}",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 20.0),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               })
//                           : Container(),
//                     ],
//                   ),
//                 ),
//               )
//             : Container(),
//       ),
//     );
//   }
//
//   String _formatDuration(Duration duration) {
//     return duration.toString().split('.').first.padLeft(8, "00");
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController controller = VideoPlayerController.network(
    'https://firebasestorage.googleapis.com/v0/b/coronahospital-3e322.appspot.com/o/Screenrecorder-2019-09-27-23-18-03-392(0).mp4?alt=media&token=53e8ab68-730e-4702-8195-a2c3dd9a3177',
  );
  ChewieController? chewieController;
  @override
  void initState() {
    controller = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/coronahospital-3e322.appspot.com/o/Screenrecorder-2019-09-27-23-18-03-392(0).mp4?alt=media&token=53e8ab68-730e-4702-8195-a2c3dd9a3177',
    );
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      showControls: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Chewie(
      controller: ChewieController(
        videoPlayerController: controller,
        autoPlay: false,
        aspectRatio: controller.value.aspectRatio,
        looping: false,
        showControls: true,
        // Try playing around with some of these other options:
        placeholder: Container(
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    chewieController!.dispose();
    controller.dispose();
    super.dispose();
  }
}
