import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Log in to existing account page based on Node Code provided
/// Button does nothing at the moment.
class ExistingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().setHeight(2960.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0, -.65),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /// Header
                    Container(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(50.0),
                      ),
                      child: Text(
                        'Node Name',
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
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(50.0)),
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
                        child: Text('Log in to Existing Account'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
