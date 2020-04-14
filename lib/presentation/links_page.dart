import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/blocs/links/bloc.dart';
import './widgets/home_bottom_bar.dart';
import './widgets/link_item.dart';
import './widgets/top_bar.dart';

/// Links page, displays all links for logged in node code.
class LinksPage extends StatelessWidget {
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<LinksBloc, LinksState>(
              builder: (context, state) {
                print(state.toString());
                if (state is LinksLoaded) {
                  final links = state.links;

                  /// Links are pushed to ContactItem and listview
                  /// builds all widgets
                  return ListView.builder(
                    itemCount: links?.length ?? 0,
                    itemBuilder: (context, index) {
                      final link = links[index];
                      return LinkItem(state.requester, link);
                    },
                  );
                } else if (state is LinksNotLoaded) {
                  return Center(
                    child: Text('Failed to load',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: ScreenUtil().setWidth(150.0),
                            )),
                  );
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
