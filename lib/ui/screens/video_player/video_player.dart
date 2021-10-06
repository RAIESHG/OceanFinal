// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ocean_publication/ui/screens/video_player/video_player_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'package:stacked/stacked.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 

    return ViewModelBuilder<VideoPlayerViewModel>.reactive(
        onModelReady: (VideoPlayerViewModel model) {
          model.onModelReady();
        },
        builder: (context, model, child) {
          return Scaffold(
            body: WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (control) {
                model.controller = control;
                model.loadLocalHTML();
              },
            ),
          );
        },
        viewModelBuilder: () => VideoPlayerViewModel());
  }
}
