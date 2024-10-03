import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_moviedb/utils/routes.dart';
import 'package:test_moviedb/view/homepage/page/homepage.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.indigo)
        )
      ),
      initialRoute: RouterApp.initial,
      getPages: RouterApp.routes,
    );
  }
}
