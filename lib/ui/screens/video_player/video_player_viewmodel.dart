import 'dart:convert';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class VideoPlayerViewModel extends BaseViewModel {
  WebViewPlusController? controller;

  void loadLocalHTML() async {
    // final path = await _localPath;
    var path = await getFilePath();
    controller!.loadUrl(path);
    // await controller!.loadUrl(Uri.dataFromString(
    //         "<html><head></head><body><div class='video' ><script type='text/javascript' src='https://content.jwplatform.com/libraries/LJ361JYj.js'></script>	<script type='text/javascript'>jwplayer.key = 'ypdL3Acgwp4Uh2/LDE9dYh3W/EPwDMuA2yid4ytssfI=';</script><div id='myElement'></div><script type='text/javascript'> jwplayer('myElement').setup({aspectratio: '5:4',width: '90%',aspectratio: '5:4',autostart: false,file : 'https://content.jwplatform.com/videos/xJ7Wcodt-cIp6U8lV.mp4',})</script></div></body></html>",
    //         mimeType: 'text/html',
    //         encoding: utf8)
    //     .toString());
  }

  void onModelReady() async {
    // String val = await _localPath;
    // print(val);
    saveFile();
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/jwplayer.html'; // 3

    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath()); // 1
    file.writeAsString("<html><head></head><body><div class='video' ><script type='text/javascript' src='https://content.jwplatform.com/libraries/LJ361JYj.js'></script>	<script type='text/javascript'>jwplayer.key = 'ypdL3Acgwp4Uh2/LDE9dYh3W/EPwDMuA2yid4ytssfI=';</script><div id='myElement'></div><script type='text/javascript'> jwplayer('myElement').setup({aspectratio: '5:4',width: '%',aspectratio: '5:4',autostart: false,file : 'https://content.jwplatform.com/videos/xJ7Wcodt-cIp6U8lV.mp4',})</script></div></body></html>"); // 2
    // file.writeAsString("<head>hi</head>");
  }
}
