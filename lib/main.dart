import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../layout/home_layout.dart';
import '../shared/bloc_observer.dart';
import '../styles/styles.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext ? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getMode(key: 'isDark') ?? false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()
              ..getBusinessNews()
              ..changeMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            darkTheme: appDarkTheme(),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
// businesses