import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String region;
  final String state;
  final double expandedHeight;
  final DateTime dateTime;
  final String comment;
  final bool isExpanded;

  const MainAppBar({
    required this.isExpanded,
    required this.comment,
    required this.state,
    required this.dateTime,
    required this.region,
    required this.expandedHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
    );

    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: expandedHeight,
      title: !isExpanded
          ? Text(
              '${region} ${DataUtils.dateTimeToString(dateTime: dateTime)}',
            )
          : null,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DataUtils.dateTimeToString(dateTime: dateTime),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset(
                  'asset/img/bad.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 24),
                Text(
                  state,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  comment,
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
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
