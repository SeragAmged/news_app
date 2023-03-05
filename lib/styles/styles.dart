import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

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
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );

ThemeData appDarkTheme() => ThemeData(
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: HexColor("333739"),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("333739"),
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0.0,
        color: HexColor("333739"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: HexColor("333739"),
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
