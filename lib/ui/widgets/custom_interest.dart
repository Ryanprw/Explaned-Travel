import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomInterest extends StatelessWidget {
  final String text;

  const CustomInterest({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon_check.png"),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle.copyWith(
              fontWeight: reguler,
            ),
          )
        ],
      ),
    );
  }
}
