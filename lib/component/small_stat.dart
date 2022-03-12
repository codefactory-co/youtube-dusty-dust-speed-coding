import 'package:dusty_dust/model/stat_model.dart';
import 'package:flutter/material.dart';

class SmallStat extends StatelessWidget {
  final StatModel stat;

  const SmallStat({
    required this.stat,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.black,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          stat.type,
          style: ts.copyWith(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Image.asset(
          stat.imgPath,
          height: 50,
        ),
        const SizedBox(height: 8.0),
        Text(
          stat.state,
          style: ts,
        ),
        Text(
          stat.level,
          style: ts,
        ),
      ],
    );
  }
}
