import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/app_distribution/environment/env_dev.dart';
import 'package:superbase_flutter/app_distribution/environment/env_prod.dart';
import 'package:superbase_flutter/configurations/configurations.dart';
import 'package:superbase_flutter/data/dependency_injection/di.dart';
import 'package:superbase_flutter/presentation/auth/cubit/auth_cubit.dart';
import 'package:superbase_flutter/routers/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Configurations()
      .setConfigurationValues(kReleaseMode ? environmentProd : environmentDev);
  await configureDependencies(
      environment: kReleaseMode ? Environment.prod : Environment.dev);

  runApp(BlocProvider(
      create: (context) => AuthCubit(), child: StatefulShellRouteApp()));
}
