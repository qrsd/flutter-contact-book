import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../data/api/api.dart';
import '../data/api/link_repository_impl.dart';
import '../domain/blocs/links/bloc.dart';
import './widgets/home_bottom_bar.dart';
import './widgets/link_item.dart';
import './widgets/top_bar.dart';

/// The home page when first launching the app. Currently defaults to showing
/// links for nodeCode NOR823
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LinksBloc>(
        create: (context) {
          return LinksBloc(
            linkRepositoryImpl: LinkRepositoryImpl(
              apiClient: ApiClient(
                httpClient: http.Client(),
              ),
            ),
          )..add(LinksLoadEvent('NOR823'));
        },
        child: _HomePageInjected());
  }
}

class _HomePageInjected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1440, height: 2960, allowFontScaling: true);
    return Scaffold(
      appBar: TopBar(
        size: ScreenUtil().setHeight(200.0),
      ),
      bottomNavigationBar: HomeBottomBar(
        size: ScreenUtil().setHeight(500.0),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<LinksBloc, LinksState>(
              builder: (context, state) {
                if (state is LinksLoaded) {
                  final links = state.links;

                  /// Links are pushed to ContactItem and listview
                  /// builds all widgets
                  return ListView.builder(
                    itemCount: links?.length ?? 0,
                    itemBuilder: (context, index) {
                      final link = links[index];
                      return LinkItem('NOR823', link);
                    },
                  );
                } else if (state is LinksNotLoaded) {
                  return Text('Failed to load');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
