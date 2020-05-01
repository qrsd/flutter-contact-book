import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/blocs/links/bloc.dart';
import './widgets/top_bar.dart';

/// This is the registration page the sign up button is currently inactive.
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _firstName;
  TextEditingController _surName;
  TextEditingController _email;
  TextEditingController _password;
  String _birthday;
  int _gender;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _surName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _birthday =
        '${DateTime.now().month}${DateTime.now().day}${DateTime.now().year}';
    _gender = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _firstName.dispose();
    _surName.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Header
            Container(
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
                  SizedBox(
                    height: ScreenUtil().setHeight(100.0),
                  ),
                ],
              ),
            ),

            /// User data fields
            Column(
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
                              controller: _firstName,
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
                              controller: _surName,
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
                              decoration: InputDecoration(hintText: 'Sur name'),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: _email,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setWidth(60.0),
                            ),
                        keyboardType: TextInputType.text,
                        onChanged: (_) {},
                        decoration: InputDecoration(
                            hintText: 'Mobile number or email address'),
                      ),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setWidth(60.0),
                            ),
                        keyboardType: TextInputType.text,
                        onChanged: (_) {},
                        decoration: InputDecoration(hintText: 'New password'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(80.0),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: ScreenUtil().setWidth(50.0)),
                        child: Text(
                          'Birthday',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: ScreenUtil().setWidth(70.0)),
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
                                        fontSize: ScreenUtil().setWidth(70.0),
                                      ),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (s) {
                              _birthday = '${s.month}${s.day}${s.year}';
                            },
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
                        groupValue: _gender,
                        onChanged: (_) {
                          setState(() {
                            _gender = 1;
                          });
                        },
                      ),
                      Text(
                        'Female',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setWidth(60.0),
                            ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: _gender,
                        onChanged: (_) {
                          setState(() {
                            _gender = 2;
                          });
                        },
                      ),
                      Text(
                        'Male',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setWidth(60.0),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// button
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(200.0)),
                child: Container(
                  height: ScreenUtil().setHeight(200.0),
                  width: MediaQuery.of(context).size.width * .9,
                  child: FlatButton(
                    onPressed: () {
                      BlocProvider.of<LinksBloc>(context).add(LinksPostEvent(
                          _firstName.text,
                          _surName.text,
                          _email.text,
                          _password.text,
                          _birthday,
                          _gender.toString()));
                    },
                    color: Color(0xff2A395A),
                    textColor: Colors.white,
                    child: Text('Sign Up'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
