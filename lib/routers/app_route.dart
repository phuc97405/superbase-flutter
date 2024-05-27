import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superbase_flutter/core/constants/app/string_constants.dart';
import 'package:superbase_flutter/core/constants/enums/language.enum.dart';
import 'package:superbase_flutter/generated/app_localizations.dart';
import 'package:superbase_flutter/presentation/auth/view/login_screen.dart';
import 'package:superbase_flutter/presentation/splash/splash_screen.dart';
import 'package:superbase_flutter/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// ScrollToHideController hideController = ScrollToHideController();

class StatefulShellRouteApp extends StatefulWidget {
  StatefulShellRouteApp({super.key});

  @override
  State<StatefulShellRouteApp> createState() => _StatefulShellRouteAppState();
}

class _StatefulShellRouteAppState extends State<StatefulShellRouteApp> {
  final GoRouter _router = GoRouter(
      // redirect: (BuildContext context, GoRouterState state) {
      //   inspect(state);
      //   if (true) {
      //     return '/login_screen';
      //   } else {
      //     return null;
      //   }
      // },
      // initialLocation: SplashScreen.path,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
          // routes: <RouteBase>[
          //   GoRoute(
          //     path: 'detailLogin',
          //     builder: (BuildContext context, GoRouterState state) {
          //       return const DetailLoginScreen();
          //     },
          //   ),
          // ],
        ),
        GoRoute(
          path: LoginScreen.path,
          name: LoginScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
          // routes: <RouteBase>[
          //   GoRoute(
          //     path: 'detailLogin',
          //     builder: (BuildContext context, GoRouterState state) {
          //       return const DetailLoginScreen();
          //     },
          //   ),
          // ],
        )
      ]);

  //     StatefulShellRoute.indexedStack(
  Locale _locale = const Locale(LanguageEnum.english, '');

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),
        () => _locale = const Locale(LanguageEnum.vietnam, ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: _locale,
      //  fallbackLocale, //initialize locale
      // ThemeData(
      //   useMaterial3: true,
      //   primaryColor: ColorConstants.instance.onPrimary,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      routerConfig: _router,
    );
  }
}
