import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../layout/home_layout.dart';
import '../shared/bloc_observer.dart';
import '../styles/styles.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: HomeLayout(),
    );
  }
}
// businesses