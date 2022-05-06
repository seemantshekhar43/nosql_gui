import 'package:flutter/material.dart';
// Horizontal Spacing
class UIHelper{
  UIHelper._();

  static const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
  static const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
  static const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
  static const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
  static const Widget horizontalSpaceLarge = SizedBox(width: 50.0);
  static const Widget verticalSpaceTiny = SizedBox(height: 5.0);
  static const Widget verticalSpaceSmall = SizedBox(height: 10.0);
  static const Widget verticalSpaceRegular = SizedBox(height: 18.0);
  static const Widget verticalSpaceMedium = SizedBox(height: 25.0);
  static const Widget verticalSpaceLarge = SizedBox(height: 50.0);

  static const EdgeInsets horizontalPaddingTiny = EdgeInsets.all(8.0);
  static const EdgeInsets horizontalPaddingSmall = EdgeInsets.all(12.0);
  static const EdgeInsets horizontalPaddingRegular = EdgeInsets.all(16.0);
  static const EdgeInsets horizontalPaddingMedium = EdgeInsets.all(24.0);
  static const EdgeInsets horizontalPaddingLarge = EdgeInsets.all(32.0);

// Screen Size helpers

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
      screenHeight(context) * percentage;

  static double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
      screenWidth(context) * percentage;
}