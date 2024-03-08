import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spiderweb_assignment/application/cart_bloc/cart_bloc.dart';
import 'package:spiderweb_assignment/application/deatil_bloc/detail_bloc.dart';
import 'package:spiderweb_assignment/application/home_bloc/home_bloc.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/domain/cart/model/model.dart';
import 'package:spiderweb_assignment/domain/cart/service_implementation/service.dart';
import 'package:spiderweb_assignment/presentaion/navigation_bar/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(CartProductModelAdapter());
  await CartService.openDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CartBloc(),
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) => DetailBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
          home: NavBar(),
        ));
  }
}
