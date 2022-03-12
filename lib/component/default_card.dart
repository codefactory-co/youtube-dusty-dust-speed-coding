import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final Widget child;

  const DefaultCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: lightColor,
        ),
        child: child,
      ),
    );
  }
}
