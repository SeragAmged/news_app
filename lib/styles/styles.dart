import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0.0,
        color: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
      ),
    );
