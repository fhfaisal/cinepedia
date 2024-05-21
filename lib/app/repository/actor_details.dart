import 'package:cinepedia/app/data/actor_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../utils/constants.dart';

Future<ActorDetailsResponse?> actorDetailsResponseApi(int id) async {
  String person =
      "${Constants.baseUrl}${Constants.apiPrefix}${Constants.person}$id";
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
    final response = await dioClient.get('$person?',queryParameters: {'api_key':Constants.apiKey});
    // debugPrint(response.data.toString());
    if(response.statusCode == 200){
      return ActorDetailsResponse.fromJson(response.data);
    }else{
      debugPrint(response.data["status"]);
    }
  } on DioException catch (e) {
    if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error actorDetailsResponseApi: $e');
  }
  return null;
}