import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/default_card.dart';
import 'package:dusty_dust/component/small_stat.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:flutter/material.dart';

final data = [
  StatModel(
    type: '미세먼지',
    state: '나쁨',
    imgPath: 'asset/img/bad.png',
    level: '55.0㎍/㎥',
  ),
  StatModel(
    type: '초미세먼지',
    state: '나쁨',
    imgPath: 'asset/img/bad.png',
    level: '28.0㎍/㎥',
  ),
  StatModel(
    type: '이산화질소',
    state: '최고',
    imgPath: 'asset/img/best.png',
    level: '0.015ppm',
  ),
  StatModel(
    type: '미세먼지 2',
    state: '나쁨',
    imgPath: 'asset/img/bad.png',
    level: '55.0㎍/㎥',
  ),
  StatModel(
    type: '초미세먼지 2',
    state: '나쁨',
    imgPath: 'asset/img/bad.png',
    level: '28.0㎍/㎥',
  ),
  StatModel(
    type: '이산화질소 2',
    state: '최고',
    imgPath: 'asset/img/best.png',
    level: '0.015ppm',
  ),
];

class HorizontalDataCard extends StatelessWidget {
  final String title;

  const HorizontalDataCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return DefaultCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            title: title,
          ),
          renderList(),
        ],
      ),
    );
  }

  Widget renderList() {
    return Container(
      height: 140,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            children: data
                .map(
                  (e) => SizedBox(
                    width: constraints.maxWidth / 3,
                    child: SmallStat(
                      stat: e,
                    ),
                  ),
                )
                .toList(),
          );
        }
      ),
    );
  }
}

