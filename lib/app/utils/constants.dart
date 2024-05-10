import 'dart:io';
class Constants{
  static const String baseUrl="https://api.themoviedb.org/"; //live
  static const String apiPrefix="3/";
  static const String apiKey="84e203c6c4de6d14ae851ff86a4fd3df";
  static const String authToken="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NGUyMDNjNmM0ZGU2ZDE0YWU4NTFmZjg2YTRmZDNkZiIsInN1YiI6IjY2MzZmZDY5OTU5MGUzMDEyY2JjODE0ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cxC4PSTxclxSmWI9lAYXom9NvhP5ds15d-G3xyHRTXU";
  static const String nowPlying="movie/now_playing";
  static const String moviePopular="movie/movie/popular";
  static const String posterUrl="https://image.tmdb.org/t/p/original/";
  static const String logInEmail="login";
  static const String signUp="register";
  static const String PROFILERESPONSE="register";
  static const bool SUBSCRIPTION= false;
  static const String ONBOARDING="false";
  static const int ROUTE_ID = 1;
  static const String ROUTENAME = "Name";
  static const String ARGUMENT_ID = "1";
  static const String CALL_TYPE = "Audio";
  static const String AGAINST_TYPE = "voucher";
  static const String URL = "url";
  static const String FILENAME = "name";
  static const String MOBILE = "name";
  static const String MESSAGE = "name";
  static const String PAYMENT_URL = "name";
  static const String LASTROUTE = "HOME";

  static String platform = "IOS"; // Default platform

  static void setPlatformType() {
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
  }

}
