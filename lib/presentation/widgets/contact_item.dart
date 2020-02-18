import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Builds contact item
class ContactItem extends StatelessWidget {
  /// placeholder value
  final int user;

  /// placeholder
  ContactItem(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(50.0)),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed('/user'),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(100.0),
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: ScreenUtil().setWidth(130.0),
                backgroundImage: AssetImage("assets/profile/${user + 1}.jpeg"),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(50.0),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'COS123',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: ScreenUtil().setWidth(70.0),
                            ),
                      ),
                      Text(
                        'Librarian',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: ScreenUtil().setWidth(60.0),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: 180 * pi / 180,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: ScreenUtil().setHeight(100.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
