import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/modules/splash/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];
}
