import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './widgets/user_bottom_bar.dart';
import './widgets/contact_item.dart';
import './widgets/top_bar.dart';

/// Default landing page on run
class UserPage extends StatelessWidget {
//  final int image;
//  final String name;
//  final String description;
//
//  UserPage(this.image, this.name, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      bottomNavigationBar: UserBottomBar(
        size: ScreenUtil().setHeight(500.0),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          //top
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //image
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(100.0),
                  ),
                  child: CircleAvatar(
                    radius: ScreenUtil().setWidth(130.0),
                    backgroundImage: AssetImage("assets/profile/1.jpeg"),
                  ),
                ),
                // code
                Text(
                  'ABC123',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: ScreenUtil().setWidth(100.0)),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(300.0),
                ),
                Icon(
                  Icons.flash_on,
                  size: ScreenUtil().setWidth(250.0),
                ),
              ],
            ),
          ),

          /// info
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(200.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(100.0),
                  ),
                  child: Text(
                    'Tyler',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: ScreenUtil().setWidth(100.0),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(200.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: ScreenUtil().setWidth(200.0),
                    ),
                    Icon(
                      Icons.message,
                      size: ScreenUtil().setWidth(200.0),
                    ),
                    Icon(
                      Icons.email,
                      size: ScreenUtil().setWidth(200.0),
                    ),
                    Image(
                      image: AssetImage('assets/icon.jpg'),
                      width: ScreenUtil().setWidth(140.0),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
