// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../router/extension.dart';

class NextButtonOnBoarding extends StatelessWidget {
  final String buttonText;
  const NextButtonOnBoarding({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Center(
          child: Row(
        children: [
          Text(
            buttonText,
            style: TextStyle(
              fontSize: FontSize.medium,
              fontFamily: FontFamily.bold,
              color: SolidColors.textPink,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 2),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 20,
              color: SolidColors.textPink,
            ),
          ),
        ],
      )),
    );
  }
}
