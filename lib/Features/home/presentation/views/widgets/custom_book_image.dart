import 'package:flutter/material.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.borderRadius, required this.imageUrl});

  final BorderRadius? borderRadius;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          color: Colors.red,
          image:  DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
