import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superbase_flutter/presentation/auth/view/login_screen.dart';

// ScrollToHideController hideController = ScrollToHideController();

class StatefulShellRouteApp extends StatelessWidget {
  StatefulShellRouteApp({super.key});
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
        // GoRoute(
        //   path: '/',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const SplashScreen();
        //   },
        //   // routes: <RouteBase>[
        //   //   GoRoute(
        //   //     path: 'detailLogin',
        //   //     builder: (BuildContext context, GoRouterState state) {
        //   //       return const DetailLoginScreen();
        //   //     },
        //   //   ),
        //   // ],
        // ),
        GoRoute(
          path: '/',
          //  LoginScreen.path,
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
  //       builder: (BuildContext context, GoRouterState state,
  //           StatefulNavigationShell navigationShell) {
  //         return ScaffoldBottomNavigationBar(
  //           navigationShell: navigationShell,
  //           hideController: scrollToHideController,
  //         );
  //       },
  //       branches: <StatefulShellBranch>[
  //         StatefulShellBranch(
  //           routes: <RouteBase>[
  //             GoRoute(
  //               path: HomeScreen.path,
  //               builder: (BuildContext context, GoRouterState state) {
  //                 return MultiBlocProvider(
  //                   providers: [
  //                     BlocProvider<HomeBloc>(
  //                       create: (BuildContext context) => HomeBloc(),
  //                     ),
  //                     BlocProvider<CategoryBloc>(
  //                       create: (BuildContext context) => CategoryBloc(),
  //                     ),
  //                   ],
  //                   child: HomeScreen(
  //                     hideBottomTabController: scrollToHideController,
  //                   ),
  //                 );
  //               },
  //               // routes: <RouteBase>[
  //               //   GoRoute(
  //               //     path: 'details',
  //               //     builder: (BuildContext context, GoRouterState state) {
  //               //       return const DetailsScreen(label: 'A');
  //               //     },
  //               //   ),
  //               // ],
  //             ),
  //           ],
  //         ),
  //         StatefulShellBranch(
  //           routes: <RouteBase>[
  //             GoRoute(
  //               path: GiftShopScreen.path,
  //               builder: (BuildContext context, GoRouterState state) {
  //                 return BlocProvider(
  //                   create: (context) => GSBloc(),
  //                   child: GiftShopScreen(
  //                     hideBottomTabController: scrollToHideController,
  //                   ),
  //                 );
  //               },
  //               // routes: <RouteBase>[
  //               //   GoRoute(
  //               //     path: 'details',
  //               //     builder: (BuildContext context, GoRouterState state) {
  //               //       return const DetailsScreen(label: 'B');
  //               //     },
  //               //   ),
  //               // ],
  //             ),
  //           ],
  //         ),

  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: appThemeData,
      // ThemeData(
      //   useMaterial3: true,
      //   primaryColor: ColorConstants.instance.onPrimary,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      routerConfig: _router,
    );
  }
}
