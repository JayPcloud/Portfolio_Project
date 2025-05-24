import 'package:flutter/material.dart';

class Loaders {


  static Widget circularLoader({double? width, double? strokeWidth}) {
    return SizedBox(
        height: width,
        width: width,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth??4,
          color: Colors.deepPurple,
        ));
  }

}