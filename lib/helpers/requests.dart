// import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ocean_publication/constants.dart';
import 'package:ocean_publication/helpers/customErrors.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';

Future<http.Response> getRequest(String url) async {
  try {
    SharedPreferencesService sharedPreferencesService =
        locator<SharedPreferencesService>();
    var header = await sharedPreferencesService
        .getCachedUser()!
        .then((value) => value != null
            ? {
                "X-Authorization": "Bearer ${value.token}",
                "Accept": "application/json",
              }
            : null);
    var response = await http.get(
      Uri.parse("$baseUrl" + url),
      headers: (header),
    );

    var test = jsonDecode(response.body);
    print(response.body);
    Map data = test;
    return response;
  } on SocketException {
    throw FetchDataException('No Internet connection');
  } on TimeoutException {
    throw FetchDataException('Request Time Out Please Try Again');
  }
}

Future<http.Response> postRequest(String url,
    {Map<String, String>? body, bool requiresHeader = false}) async {
  //
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  var header;
  var getToken = await sharedPreferencesService.getCachedUser();

  if (getToken != null) {
    header = {
      "X-Authorization": "Bearer ${getToken.token}",
      "Accept": "application/json",
    };
  } else {
    header = {
      // "X-Authorization": "Bearer ${getToken.token}",
      "Accept": "application/json",
    };
  }

  print(body);
  try {
    var response = await http.post(Uri.parse("$baseUrl" + url),
        headers: header, body: body);

    var test = jsonDecode(response.body);
    Map data = test;
    print(response.body);

    print("Status Codeee ${response.statusCode}");
    return response;
  } on SocketException {
    throw FetchDataException('No Internet connection');
  } on TimeoutException {
    throw FetchDataException('Request Time Out Please Try Again');
  }
}

Future<Response> postListRequest(String url,
    {required List cartList, bool requiresHeader = false}) async {
  //
  var dio = Dio();
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  var header;
  var getToken = await sharedPreferencesService.getCachedUser();

  if (getToken != null) {
    header = {
      "X-Authorization": "Bearer ${getToken.token}",
      "Accept": "application/json",
    };
  }
  try {
    dio.options.headers["X-Authorization"] = "token ${getToken!.token}";
    var responses = await dio.post("$baseUrl" + url,
        queryParameters: {"cart": cartList, "payment_method": "esewa"});

    // var test = jsonDecode(response.body);
    // Map data = test;
    // print(response.body);

    return responses;
  } on SocketException {
    throw FetchDataException('No Internet connection');
  } on TimeoutException {
    throw FetchDataException('Request Time Out Please Try Again');
  }
}

Future<Map> httpMultipartImageRequest(
    {required List imageFileList,
    required String url,
    required String imageField}) async {
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  var getToken = await sharedPreferencesService.getCachedUser();

  // base64Image = base64Encode(imageFile!.readAsBytesSync());
  final request = http.MultipartRequest('POST', Uri.parse(url));
  // print("${imageFile!.readAsBytesSync()}");
  // imageFile.writeAsBytes(base64.decode(base64Image));
  for (int i = 0; i < imageFileList.length; i++) {
    for (int j = 0; j < imageFileList[i].length; j++) {
      if (imageFileList[i][j].length == 0) {
      } else {
        final imageFileAttach = await http.MultipartFile.fromBytes(
          imageField,
          imageFileList[i][j],
          filename: "file.jpg",
        );
        request.files.add(imageFileAttach);
      }
    }
  }
  // List fields = [...field.keys.map((e) => e)];
  // List fieldValues = [...field.values.map((e) => e)];
  //  final imageFileAttach = await http.MultipartFile("productImage", imageFile,);
  // final imageFileAttach = await http.MultipartFile.fromPath("productImage", image![0].path,filename: "file.jpg");
  // final imageFileAttach = await http.MultipartFile.fromString("productImage", imageFile!.);
  // for (int j = 0; j < field.length; j++) {
  //   request.fields[fields[j]] = fieldValues[j];
  // }
  request.headers["X-Authorization"] = "Bearer ${getToken!.token!}";

  final streamResponse = await request.send();
  final response = await http.Response.fromStream(streamResponse);
  print(response.body);
  var test = jsonDecode(response.body);
  Map data = test;
  return data;
}

// Future<Response> postRequestFile(String url,
//     {Map<String, String> header, Map<String, String> body}) async {
//   //
//   var response = await Dio().post(
//     "$baseUrl" + url,
//     data: FormData.fromMap(body),
//   );
//   return response;
// }
