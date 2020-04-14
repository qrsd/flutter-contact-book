import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './menu_drawer.dart';
import './route_builder.dart';

/// Top bar with menu widget that pushes login/registration page.
class TopBar extends StatelessWidget implements PreferredSizeWidget {
  /// Size of top app bar.
  final double size;

  /// Size must be provided when creating app bar.
  TopBar({@required this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () => Navigator.of(context).push(fullRouteBuilder(
            context, MenuDrawer(), Offset(-1, 0.0), Offset(-.25, 0.0))),
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20.0),
            bottom: ScreenUtil().setWidth(100.0),
          ),
          child: Icon(
            Icons.menu,
            size: ScreenUtil().setHeight(150.0),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
