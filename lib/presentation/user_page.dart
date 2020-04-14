import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api.dart';
import '../data/api/broker_repository_impl.dart';
import '../domain/blocs/broker/bloc.dart';
import '../domain/models/broker.dart';
import './widgets/home_bottom_bar.dart';
import './widgets/top_bar.dart';

/// This is the user page that is displayed when selecting
/// one of the links from the links page.
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;
    return BlocProvider<BrokersBloc>(
        create: (context) {
          return BrokersBloc(
            brokerRepositoryImpl: BrokerRepositoryImpl(
              apiClient: ApiClient(
                httpClient: http.Client(),
              ),
            ),
          )..add(BrokersLoadEvent(args[0], args[1]));
        },
        child: _UserPageInjected());
  }
}

class _UserPageInjected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      bottomNavigationBar: BottomBar(
        size: ScreenUtil().setHeight(500.0),
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<BrokersBloc, BrokersState>(
        builder: (context, state) {
          if (state is BrokersLoaded) {
            final Broker broker = state.broker;
            return Column(
              children: <Widget>[
                //top
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      /// image/icon
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(100.0)),
                        child: Container(
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
                      ),

                      /// Destination ID
                      Text(
                        broker.destinationId.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: ScreenUtil().setWidth(100.0)),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(300.0),
                      ),

                      /// Thunderbolt Icon
                      Icon(
                        Icons.flash_on,
                        size: ScreenUtil().setWidth(250.0),
                      ),
                    ],
                  ),
                ),
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

                        /// Broker first name
                        child: Text(
                          broker.name,
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
                          /// Phone
                          InkWell(
                            onTap: () => launch('tel:${broker.phone}'),
                            child: Icon(
                              Icons.phone,
                              size: ScreenUtil().setWidth(200.0),
                            ),
                          ),

                          /// SMS
                          InkWell(
                            onTap: () => launch('sms:${broker.phone}'),
                            child: Icon(
                              Icons.message,
                              size: ScreenUtil().setWidth(200.0),
                            ),
                          ),

                          /// Email
                          InkWell(
                            onTap: () => launch('mailto:${broker.email}'),
                            child: Icon(
                              Icons.email,
                              size: ScreenUtil().setWidth(200.0),
                            ),
                          ),

                          /// For instagram but not currently implemented
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
            );
          } else if (state is BrokersNotLoaded) {
            return Text('Failed to load');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
