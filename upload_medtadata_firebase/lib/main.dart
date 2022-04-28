import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upload_medtadata_firebase/config/provider_config.dart';
import 'package:upload_medtadata_firebase/config/router_config.dart';
import 'package:upload_medtadata_firebase/core/constants/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePaths.splash,
          routes: AppRouter.routes(),
        ));
  }
}

