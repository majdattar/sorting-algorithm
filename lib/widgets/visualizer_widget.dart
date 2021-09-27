import 'package:flutter/material.dart';

Widget VisualizerWidget(int height) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: AnimatedContainer(
        height: height * 2,
        width: 10,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(color: Colors.brown[100]),),
  );
}