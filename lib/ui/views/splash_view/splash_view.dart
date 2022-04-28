import 'package:flutter/material.dart';
import 'package:upload_medtadata_firebase/core/constants/routes.dart';
import 'package:upload_medtadata_firebase/core/view_models/base/base_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 2) , (){
      BaseViewModel().goTo(context, path: RoutePaths.home, pushAndReplace: true);
    });

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller?.repeat(reverse: true);
    controller?.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Opacity(
            opacity: controller?.value as double,
            child: Image.asset(
              "assets/logo.jpeg",
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }


}
