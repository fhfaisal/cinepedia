import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../data/now_playing.dart';
import '../data/popular.dart';
import '../utils/constants.dart';

Future<NowPlayingResponse?> nowPlayingResponseApi(Map<String, dynamic> values) async {
  String nowPlaying =
      "${Constants.baseUrl}${Constants.apiPrefix}${Constants.nowPlying}";
  var dioClient = Dio();
  dioClient.options.headers['Accept'] = "application/json";
  dioClient.options.headers['content-Type'] = 'application/json';
  dioClient.options.headers['Access-Control-Allow-Origin'] = '*';
  dioClient.options.headers["X-Requested-With"] = "XMLHttpRequest";
  dioClient.options.headers['Access-Control-Allow-Credentials'] = true;
  dioClient.options.headers['Access-Control-Allow-Headers'] = {
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
  };
  dioClient.options.headers['Access-Control-Allow-Methods'] =
  "POST, GET, OPTIONS, PUT, DELETE, HEAD";
  try {
    final response = await dioClient.get('$nowPlaying?',queryParameters: {'api_key':Constants.apiKey});
    debugPrint(response.data.toString());
    if(response.statusCode == 200){
      return NowPlayingResponse.fromJson(response.data);
    }else{
      debugPrint(response.data["status"]);
    }
  } on DioError catch (e) {
    if(e.type == DioErrorType.connectionTimeout || e.type == DioErrorType.receiveTimeout){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error nowPlayingResponseApi: $e');
  }
  return null;
}
Future<PopularResponse?> popularResponseApi(Map<String, dynamic> values) async {
  String popular =
      "${Constants.baseUrl}${Constants.apiPrefix}${Constants.moviePopular}";
  var dioClient = Dio();
  dioClient.options.headers['Accept'] = "application/json";
  dioClient.options.headers['content-Type'] = 'application/json';
  dioClient.options.headers['Access-Control-Allow-Origin'] = '*';
  dioClient.options.headers["X-Requested-With"] = "XMLHttpRequest";
  dioClient.options.headers['Access-Control-Allow-Credentials'] = true;
  dioClient.options.headers['Access-Control-Allow-Headers'] = {
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
  };
  dioClient.options.headers['Access-Control-Allow-Methods'] =
  "POST, GET, OPTIONS, PUT, DELETE, HEAD";
  try {
    final response = await dioClient.get('$popular?',queryParameters: {'api_key':Constants.apiKey});
    debugPrint(response.data.toString());
    if(response.statusCode == 200){
      return PopularResponse.fromJson(response.data);
    }else{
      debugPrint(response.data["status"]);
    }
  } on DioError catch (e) {
    if(e.type == DioErrorType.connectionTimeout || e.type == DioErrorType.receiveTimeout){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error nowPlayingResponseApi: $e');
  }
  return null;
}

