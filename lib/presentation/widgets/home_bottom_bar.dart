import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bottom bar for the home page with stubbed buttons.
class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  /// Size of top app bar
  final double size;

  /// Size must be provided when creating app bar
  BottomBar({@required this.size});

  @override
  Widget build(BuildContext context) {
    double _iconSize = ScreenUtil().setHeight(200.0);
    return BottomAppBar(
        child: Row(
      children: <Widget>[
        /// People icon
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/links');
            },
            child: Icon(
              Icons.people,
              size: _iconSize,
            ),
          ),
        ),

        /// Search icon
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Icon(
              Icons.search,
              size: _iconSize,
            ),
          ),
        ),

        /// History icon
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/activity');
            },
            child: Icon(
              Icons.history,
              size: _iconSize,
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
