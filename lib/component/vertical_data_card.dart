import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/default_card.dart';
import 'package:dusty_dust/model/time_stat_model.dart';
import 'package:flutter/material.dart';

final data = [
  ...List.generate(
    24,
    (index) => TimeStatModel(
      time: '${(19 + index) % 24}시',
      imgPath: index % 2 == 0 ? 'asset/img/worst.png' : 'asset/img/best.png',
      level: index % 2 == 0 ? '최악' : '최고',
    ),
  ).toList(),
];

class VerticalDataCard extends StatelessWidget {
  final String title;

  const VerticalDataCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(title: title),
          Column(
            children: data
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                      top:  e.key == 0 ? 8.0 : 0,
                      bottom: 8.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.value.time,
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            e.value.imgPath,
                            height: 20,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            e.value.level,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
