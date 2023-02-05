import 'package:flutter/material.dart';
import 'package:zum_clone/utils/colors.dart';

class Meetingoption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onchange;
  const Meetingoption(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onchange,
          )
        ],
      ),
    );
  }
}
