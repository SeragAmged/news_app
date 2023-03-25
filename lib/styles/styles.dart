import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
      ),
    );

ThemeData appDarkTheme() => ThemeData(
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.black45,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black45,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0.0,
        color: Colors.black45,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black45,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
