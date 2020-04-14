import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/blocs/links/bloc.dart';
import './widgets/top_bar.dart';

/// Log in to existing account page based on Node Code provided
/// Button does nothing at the moment.
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1440, height: 2960, allowFontScaling: true);
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// Header
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(50.0),
                  top: ScreenUtil().setHeight(100.0)),
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
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50.0)),
              child: TextField(
                controller: _controller,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setWidth(80.0),
                    ),
                keyboardType: TextInputType.text,
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
                onPressed: () {
                  Navigator.pushNamed(context, '/links');
                  BlocProvider.of<LinksBloc>(context)
                      .add(LinksLoadEvent(_controller.text.toUpperCase()));
                  _controller.clear();
                  FocusScope.of(context).unfocus();
                },
                child: Text('Log in to Existing Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
