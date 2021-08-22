import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieWidget extends StatelessWidget {
  final String path;
  final double size;
  const CustomLottieWidget({Key key, @required this.path, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/$path.json', repeat: true, width: size, height: size);
  }
}
