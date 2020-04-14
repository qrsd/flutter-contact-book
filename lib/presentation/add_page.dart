import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './widgets/home_bottom_bar.dart';
import './widgets/top_bar.dart';

/// Add a new user link page
/// stubbed.
class AddPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// Node
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(50.0),
                  top: ScreenUtil().setHeight(100.0)),
              child: Text(
                'Node',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: ScreenUtil().setWidth(100.0)),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100.0),
            ),

            /// Node Textfield
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50.0)),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setWidth(80.0),
                    ),
                keyboardType: TextInputType.text,
                onChanged: (_) {},
                decoration: InputDecoration(hintText: 'Code'),
              ),
            ),

            /// Link Note
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(50.0),
                  top: ScreenUtil().setHeight(100.0)),
              child: Text(
                'Link Note',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: ScreenUtil().setWidth(100.0)),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100.0),
            ),

            /// Textfield
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50.0)),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setWidth(80.0),
                    ),
                keyboardType: TextInputType.text,
                onChanged: (_) {},
                decoration: InputDecoration(hintText: 'Note'),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100.0),
            ),

            /// Button
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(50.0),
              ),
              height: ScreenUtil().setHeight(200.0),
              child: FlatButton(
                color: Color(0xff2A395A),
                textColor: Colors.white,
                onPressed: () {},
                child: Text('Link Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
