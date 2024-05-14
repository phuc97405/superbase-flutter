import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:superbase_flutter/presentation/auth/view/login_screen.dart';

enum typeDivider { vertical, horizontal }

class SplashScreen extends StatefulWidget {
  static String path = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // AuthCacheManager get authCacheManager => injector<AuthCacheManager>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // context.read<AuthBloc>().add(AuthStarted());
    Future.delayed(const Duration(seconds: 2), () async {
      context.go(LoginScreen.path);
    });
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.63),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(color: Colors.white),
                child: Text(
                  'Splash Screen',
                  textAlign: TextAlign.center,
                  // style: context.textTheme.display_smB.copyWith(height: 0.6)
                ),
              ),
            ),
          ],
        )));
  }
}
