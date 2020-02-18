import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Refactored bottom app bar widget
class HomeBottomBar extends StatelessWidget implements PreferredSizeWidget {
  /// Size of top app bar
  final double size;

  /// Size must be provided when creating app bar
  HomeBottomBar({@required this.size});

  @override
  Widget build(BuildContext context) {
    double _iconSize = ScreenUtil().setHeight(200.0);
    return BottomAppBar(
        child: Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(0.0)),
              child: Icon(
                Icons.people,
                size: _iconSize,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(0.0)),
              child: Icon(
                Icons.search,
                size: _iconSize,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(0.0)),
              child: Icon(
                Icons.history,
                size: _iconSize,
              ),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
