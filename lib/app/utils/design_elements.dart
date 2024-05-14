import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

EdgeInsets fixMargin(){
  return const EdgeInsets.symmetric(horizontal: 16);
}
SizedBox separationGap(){
  return const SizedBox(height: 10);
}
formatOnlyDate(DateTime? dateTime) {
  if (dateTime == null) {
    return null; // Return null if input is null
  }

  try {
    final format = DateFormat('MMMyy', 'en_US');
    return format.format(dateTime);
  } catch (e) {
    return null; // Return null if there's an error during formatting
  }
}
String formatRuntime(int minutes) {
  final int hours = minutes ~/ 60;
  final int remainingMinutes = minutes % 60;
  return hours > 0 ? '$hours${'h'} $remainingMinutes${'m'}' : '$remainingMinutes';
}

