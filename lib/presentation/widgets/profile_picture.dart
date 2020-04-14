import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extracted widget for profile picture
class ProfilePicture extends StatelessWidget {
  /// [color] of profile picture, can/will be swapped for actual image
  /// in future iterations.
  final Color color;

  /// Constructor
  ProfilePicture({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: ScreenUtil().setWidth(5)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        Icons.person,
        color: color,
        size: ScreenUtil().setWidth(200.0),
      ),
    );
  }
}
