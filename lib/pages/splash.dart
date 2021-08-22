import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/services/tesis.dart';
import 'map.dart';
import '../widgets/custom_lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.85;
    print(size);
    return AnimatedSplashScreen.withScreenFunction(
        splashIconSize: double.infinity,
        splash: Center(
          child: CustomLottieWidget(path: 'splash', size: size),
        ),
        screenFunction: () async {
          var tesisler = await getTesisler();
          return MapPage(
            data: tesisler,
          );
        });
  }
}
