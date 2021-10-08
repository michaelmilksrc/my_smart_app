import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/modules/home/home_module.dart';
import 'package:my_smart_app/app/modules/login/login_module.dart';
import 'package:my_smart_app/app/modules/splash/splash_module.dart';
import 'package:my_smart_app/app/shared/auth/auth_module.dart';
import 'package:my_smart_app/app/shared/auth/guard_route/auth_guard.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
        // ChildRoute(
        //   "/second",
        //   child: (_, args) => SecondPage(),
        //   transition: TransitionType.custom,
        //   customTransition: CustomTransition(
        //     transitionBuilder: (context, anim1, anim2, child) {
        //       return FadeTransition(
        //         opacity: anim1,
        //         child: child,
        //       );
        //     },
        //   ),
        // ),
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/home", module: HomeModule(), guards: [AuthGuard()]),
        ModuleRoute("/login", module: LoginModule()),
        //WildcardRoute(child: (context, args) => NotFoundPage()),
      ];
}
