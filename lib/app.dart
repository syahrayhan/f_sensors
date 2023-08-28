import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/dependencie_injection.dart';
import 'package:flutter_sensor/features/crud_data/bloc/crud_bloc.dart';
import 'package:flutter_sensor/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_sensor/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter_sensor/splah_page.dart';

import 'core/helpers/page_routes.dart';
import 'core/helpers/style.dart';
import 'core/widgets/menu/menu_cubit.dart';

class FlutterSensorApp extends StatelessWidget {
  const FlutterSensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SignUpBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SignInBloc>(),
        ),
        BlocProvider(
          create: (context) => MenuCubit(),
        ),
        BlocProvider(
          create: (context) => sl<CrudBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Sensor",
        theme: lightTheme,
        navigatorKey: navigatorKey,
        home: const SplashPage(),
      ),
    );
  }
}
