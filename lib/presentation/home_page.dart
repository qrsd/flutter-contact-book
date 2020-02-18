import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './widgets/home_bottom_bar.dart';
import './widgets/contact_item.dart';
import './widgets/top_bar.dart';

/// Default landing page on run
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1440, height: 2960, allowFontScaling: true);
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      bottomNavigationBar: HomeBottomBar(
        size: ScreenUtil().setHeight(500.0),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                return ContactItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
