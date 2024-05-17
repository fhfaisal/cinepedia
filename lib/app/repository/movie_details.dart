import 'package:cinepedia/app/data/cradits.dart';
import 'package:cinepedia/app/data/image.dart';
import 'package:cinepedia/app/data/reviews.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../utils/constants.dart';

Future<CreditsResponse?> creditsResponseApi(int id) async {
  String credits =
      "${Constants.baseUrl}${Constants.apiPrefix}${Constants.movieDetails}$id${Constants.credits}";
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
    final response = await dioClient.get('$credits?',queryParameters: {'api_key':Constants.apiKey});
    // debugPrint(response.data.toString());
    if(response.statusCode == 200){
      return CreditsResponse.fromJson(response.data);
    }else{
      debugPrint(response.data["status"]);
    }
  } on DioException catch (e) {
    if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error creditsResponseApi: $e');
  }
  return null;
}
Future<ImagesResponse?> imageResponseApi(int id) async {
  String image =
      "${Constants.baseUrl}${Constants.apiPrefix}${Constants.movieDetails}$id${Constants.images}";
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
    final response = await dioClient.get('$image?',queryParameters: {'api_key':Constants.apiKey});
    // debugPrint(response.data.toString());
    if(response.statusCode == 200){
      return ImagesResponse.fromJson(response.data);
    }else{
      debugPrint(response.data["status"]);
    }
  } on DioException catch (e) {
    if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error imageResponseApi: $e');
  }
  return null;
}
Future<ReviewsResponse?> reviewsResponseApi(int id) async {
  String reviews =
      "${Constants.baseUrl}${Constants.apiPrefix}${Constants.movieDetails}$id${Constants.reviews}";
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
    final response = await dioClient.get('$reviews?',queryParameters: {'api_key':Constants.apiKey});
    debugPrint(response.data.toString());
    if(response.statusCode == 200){
      return ReviewsResponse.fromJson(response.data);
    }else{
      debugPrint(response.data["status"]);
    }
  } on DioException catch (e) {
    if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error reviewsResponseApi: $e');
  }
  return null;
}