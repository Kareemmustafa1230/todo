import 'package:flutter/material.dart';

class MyTheme{
  static Color whiteColor = Colors.white;
  static Color primaryLight = Color(0xff5D9CEC);
  static Color greenLight = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color blackColor = Color(0xff383838);

  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true ,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor:primaryLight,
      unselectedItemColor: blackColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(12),
          topRight: Radius.circular(12),
        )
      ),
    )
  );
}

