import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/models/link.dart';

/// Builds a link item.
class LinkItem extends StatelessWidget {
  /// Node code of requester.
  final String nodeCode;

  /// Link object containing card information.
  final Link link;

  /// Constructor
  LinkItem(this.nodeCode, this.link);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(50.0)),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed('/user', arguments: [nodeCode, link.destinationID]),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(100.0),
          ),
          child: Row(
            children: <Widget>[
              /// Icon/image
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xff2A395A),
                      width: ScreenUtil().setWidth(5)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.person,
                  color: Color(0xff2A395A),
                  size: ScreenUtil().setWidth(200.0),
                ),
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
                        link.destinationID.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: ScreenUtil().setWidth(70.0),
                            ),
                      ),

                      /// Description below ID
                      Text(
                        link.name,
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
