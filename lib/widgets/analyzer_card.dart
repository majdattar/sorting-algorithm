import 'package:flutter/material.dart';

class AnalyzerCard extends StatelessWidget {
final String title;
final int sortValue;

 AnalyzerCard({required this.title, required this.sortValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Card(
        elevation: 2,
        color: Colors.brown[100],
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(color: Colors.brown),),
            Text("$sortValue CU", style: const TextStyle(color: Colors.white),),
          ],
        )),
      ),
    );
  }
}
