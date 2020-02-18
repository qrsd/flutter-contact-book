import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is the registration/login page
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// will be replaced with BLoC
  var radioValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().setHeight(2960.0),
          child: Stack(
            children: <Widget>[
              /// header
              Align(
                alignment: Alignment(-1, -.7),
                child: Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(50.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Registration',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: ScreenUtil().setWidth(100.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(100.0),
                      ),
                      Text(
                        "It's free to link",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: ScreenUtil().setWidth(70.0)),
                      ),
                    ],
                  ),
                ),
              ),

              /// center
              Align(
                alignment: Alignment(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(50.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  textCapitalization: TextCapitalization.words,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setWidth(60.0),
                                      ),
                                  keyboardType: TextInputType.text,
                                  onChanged: (_) {},
                                  decoration:
                                      InputDecoration(hintText: 'First name'),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(70.0),
                              ),
                              Expanded(
                                child: TextField(
                                  textCapitalization: TextCapitalization.words,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setWidth(60.0),
                                      ),
                                  keyboardType: TextInputType.text,
                                  onChanged: (_) {},
                                  decoration:
                                      InputDecoration(hintText: 'Sur name'),
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setWidth(60.0),
                                    ),
                            keyboardType: TextInputType.text,
                            onChanged: (_) {},
                            decoration: InputDecoration(
                                hintText: 'Mobile number or email address'),
                          ),
                          TextField(
                            obscureText: true,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setWidth(60.0),
                                    ),
                            keyboardType: TextInputType.text,
                            onChanged: (_) {},
                            decoration:
                                InputDecoration(hintText: 'New password'),
                          ),
                        ],
                      ),
                    ),
                    // birthday
                    SizedBox(
                      height: ScreenUtil().setHeight(80.0),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(50.0)),
                            child: Text(
                              'Birthday',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: ScreenUtil().setWidth(70.0)),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(80.0),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            height: ScreenUtil().setHeight(250.0),
                            child: CupertinoTheme(
                              data: CupertinoThemeData(
                                textTheme: CupertinoTextThemeData(
                                  dateTimePickerTextStyle:
                                      CupertinoTheme.of(context)
                                          .textTheme
                                          .textStyle
                                          .copyWith(
                                            color: Color(0xff2A395A),
                                            fontSize:
                                                ScreenUtil().setWidth(70.0),
                                          ),
                                ),
                              ),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (_) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(100.0),
                    ),
                    // gender selector
                    Container(
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (_) {
                              setState(() {
                                radioValue = _;
                              });
                            },
                          ),
                          Text(
                            'Female',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setWidth(60.0),
                                    ),
                          ),
                          Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (_) {
                              setState(() {
                                radioValue = _;
                              });
                            },
                          ),
                          Text(
                            'Male',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setWidth(60.0),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// buttons
              Align(
                alignment: Alignment(0, .8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(200.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Color(0xff2A395A),
                        textColor: Colors.white,
                        child: Text('Sign Up'),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200.0),
                      child: FlatButton(
                        color: Color(0xff2A395A),
                        textColor: Colors.white,
                        onPressed: () =>
                            Navigator.pushNamed(context, '/existing'),
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
