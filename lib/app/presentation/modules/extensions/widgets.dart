import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

extension ExToWidget on String {
  Widget toJpgImage(
          {double size = 127.0,
          double radius = 0,
          Color? color,
          BoxFit boxFit = BoxFit.fitWidth}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image(
          image: AssetImage(this),
          color: color,
          alignment: Alignment.center,
          fit: boxFit,
          width: size,
        ),
      );

  Widget toPNGImage({double size = 127.0, Color? color}) => ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image(
          image: AssetImage(this),
          color: color,
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          width: size,
        ),
      );

  Widget toNetworkImage({double size = 127.0}) => ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: CachedNetworkImage(
          imageUrl: this,
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          width: size,
        ),
      );
}
