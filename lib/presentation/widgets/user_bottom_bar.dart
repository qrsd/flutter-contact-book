import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bottom bar for user/link page with stubbed buttons.
class UserBottomBar extends StatelessWidget implements PreferredSizeWidget {
  /// Size of top app bar
  final double size;

  /// Size must be provided when creating app bar
  UserBottomBar({@required this.size});

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
                Icons.create,
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
                Icons.remove_circle_outline,
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
