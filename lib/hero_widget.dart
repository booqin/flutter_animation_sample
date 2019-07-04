import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  final String photo;
  final double width;
  final VoidCallback onTap;

  const PhotoHero({Key key, this.photo, this.width, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.asset(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}
