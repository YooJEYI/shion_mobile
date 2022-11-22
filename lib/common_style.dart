import 'package:flutter/material.dart';

class CommonStyle {
  CommonStyle._();

  /* default */
  static const Color defaultBackground = Color(0xff373A3F);
  static const Color defaultWhite = Color(0xffFFFFFF);


  /* default indicator */
  static const Color indicatorColor = Color(0xff6883f4);
  static const Color indicatorBackground = Colors.white;


  /* main app bar */
  static const TextStyle mainAppBarTitleTextStyle = TextStyle(
      fontFamily: 'Gothic A1',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5
  );


  /* dialog */
  static const TextTheme dialogTextTheme = TextTheme(
      headline6: TextStyle(
          fontFamily: 'Gothic A1',
          fontSize: 17,
          color: Color(0xff373A41),
          fontWeight: FontWeight.w600
      ),
      subtitle1: TextStyle(
          fontFamily: 'Gothic A1',
          fontSize: 15,
          color: Color(0xff75888C),
          height: 1.22
      )
  );

  static const BoxDecoration dialogBox = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );

  static const TextStyle dialogMainText = TextStyle(
    fontFamily: 'Gothic A1',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: -0.5,
  );

  static const TextStyle dialogSubText = TextStyle(
    fontFamily: 'Gothic A1',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: -1,
    color: Color(0xff949AA8),
  );


  /* common search bar */
  static const BoxDecoration searchInputBoxDecoration = BoxDecoration(
      color: Color(0xff484C55),
      borderRadius: BorderRadius.all(Radius.circular(10))
  );
  static const TextStyle searchInputTextStyle = TextStyle(
      fontFamily: 'Gothic A1',
      fontSize: 14,
      color: Colors.white
  );
  static const TextStyle searchInputHintTextStyle = TextStyle(
      fontFamily: 'Gothic A1',
      fontSize: 14,
      color: Color(0xffADAFAD)
  );
  static const Color searchInputCursorColor = Color(0xff6C7DF3);

  /* common content container */
  static const BoxDecoration containerBoxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
      )
  );

  /*list page body*/
  static const refreshIndicatorColor = Color(0xff989898);
  static const listBodyTopMargin = EdgeInsets.only(top: 16, bottom: 10);
  static const listBodyTopTextStyle = TextStyle(
      color: Color(0xFF23343B),
      fontFamily: 'Gothic A1',
      fontWeight: FontWeight.bold
  );
  static const listBodyTopBadgeColor = Color(0xFF6782F3);
  static const listBodyTopLineDecoration = BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: Color(0xffD5D5D5),
              width: 1
          )
      )
  );

  static const Color badgeGrey = Color(0xff858995);
}