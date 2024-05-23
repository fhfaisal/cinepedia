import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../modules/actorDetails/bindings/actor_details_binding.dart';
import '../modules/actorDetails/views/actor_details_view.dart';
import '../modules/bottomNavigationBar/bindings/bottom_navigation_bar_binding.dart';
import '../modules/bottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movieDetails/bindings/movie_details_binding.dart';
import '../modules/movieDetails/views/movie_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATION_BAR;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.BOTTOM_NAVIGATION_BAR,
        page: () => const BottomNavigationBarView(),
        binding: BottomNavigationBarBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.MOVIE_DETAILS,
        page: () => const MovieDetailsView(),
        binding: MovieDetailsBinding(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.ACTOR_DETAILS,
        page: () => const ActorDetailsView(),
        binding: ActorDetailsBinding(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
