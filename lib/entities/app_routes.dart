import 'package:flutter/widgets.dart';
import 'package:flutter_splash_animation_example/entities/named_routes.dart';
import 'package:flutter_splash_animation_example/widgets/home_screen.dart';
import 'package:flutter_splash_animation_example/widgets/splash_app.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  final Map<String, Widget Function(BuildContext)> appRoutes = <String, Widget Function(BuildContext)>{
    NamedRoutes.home.route: (context) => const HomeScreen(),
  };

  return appRoutes[settings.name] != null
      ? PageRouteBuilder(
          pageBuilder: (context, animation, _) {
            return appRoutes[settings.name]!(context);
          },
          settings: settings)
      : null;
}
