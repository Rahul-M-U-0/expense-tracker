import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final String imagepath;
  const MyLogo({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]),
      child: Image.asset(
        imagepath,
        height: 70,
      ),
    );
  }
}
