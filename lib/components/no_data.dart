import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoData extends StatelessWidget {
  final String text;
  final String image;

  const NoData({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          SvgPicture.asset(image, width: 100, height: 300),
          const SizedBox(height: 24),
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
