import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './widgets/home_bottom_bar.dart';
import './widgets/profile_picture.dart';
import './widgets/top_bar.dart';

/// Activity page, currently all data is dummied
class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      bottomNavigationBar: BottomBar(
        size: ScreenUtil().setHeight(500.0),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(300.0),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30.0),
            ),
            child: FloatingSearchBar(
              children: <Widget>[Container()],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return _dummyData(index, context);
            },
          )),
        ],
      ),
    );
  }
}

Widget _dummyData(index, context) {
  var text = [
    'Mauris gravida id odio at aliquam. ',
    'Cras in massa sem. In hac habitasse platea ',
    'dictumst. Ut quis maximus nibh. Donec eget ',
    'Cras in massa sem. In hac habitasse platea dictumst.'
        ' Ut quis maximus nibh. Donec eget '
  ];
  var code = ['COS123', 'ABC123', 'Grandma Vie', 'Grandpa Vie'];
  var time = ['10:17 PM', '09:04 PM', '08:42 PM', '09:07 PM'];
  return Padding(
    padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(50.0)),
    child: InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(100.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            /// Icon/image
            ProfilePicture(
              color: Color(0xff2A395A),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(50.0),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /// Destination ID
                    Text(
                      code[index],
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: ScreenUtil().setWidth(70.0),
                          ),
                    ),

                    /// Description below ID
                    Text(
                      text[index],
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: ScreenUtil().setWidth(50.0),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(15.0),
            ),
            Text(
              time[index],
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: ScreenUtil().setWidth(55.0),
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
