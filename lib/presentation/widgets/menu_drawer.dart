import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/blocs/links/bloc.dart';
import './profile_picture.dart';

/// Left hand screen drawer, only two buttons functioning
class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textSize = ScreenUtil().setHeight(85.0);
    return Dismissible(
      onDismissed: (_) => Navigator.of(context).pop(),
      key: UniqueKey(),
      child: Center(
        child: Material(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: Color(0xff2A395A),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 3),
                  blurRadius: 5,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /// Top box
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(60.0)),
                  height: MediaQuery.of(context).size.height / 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfilePicture(
                        color: Colors.white,
                      ),
                      BlocBuilder<LinksBloc, LinksState>(
                        builder: (context, state) {
                          var text;
                          if (state is LinksLoaded) {
                            text = state.requester;
                          } else {
                            text = 'None';
                          }
                          return Text(
                            text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),

                /// Bottom box
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil().setHeight(100),
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: Text(
                            'New Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/registration');
                          },
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(400),
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Invite Friends',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            Icons.lightbulb_outline,
                            color: Colors.white,
                          ),
                          label: Text(
                            'FAQ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
