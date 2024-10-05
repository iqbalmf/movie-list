import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_list/utils/routes.dart';
import 'package:movie_list/view/detailpage/bloc/detail_bloc.dart';
import 'package:movie_list/view/homepage/bloc/home_bloc.dart';
import 'injection.dart' as di;

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => di.locator<HomeBloc>()),
        BlocProvider<DetailBloc>(create: (context) => di.locator<DetailBloc>())
      ],
      child: GetMaterialApp(
        title: "Movie App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.indigo))),
        initialRoute: RouterApp.initial,
        getPages: RouterApp.routes,
      ),
    );
  }
}
