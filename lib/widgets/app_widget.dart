import 'package:flutter/material.dart';
import 'package:flutter_splash_animation_example/di.dart';
import 'package:flutter_splash_animation_example/entities/app_routes.dart';
import 'package:flutter_splash_animation_example/entities/named_routes.dart';
import 'package:flutter_splash_animation_example/widgets/splash_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashApp(
      initDependencies: initDependencies,
      appWidget: MaterialApp(
        onGenerateRoute: generateRoute,
        initialRoute: NamedRoutes.home.route,
      ),
    );
  }
}
