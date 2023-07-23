import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';

class SetupSection extends StatelessWidget {
  const SetupSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width*0.9,
          child: MaterialButton(
    color: kButtonColorBlue,
    onPressed: () {},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Set up",
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      "See what you can download",
      style: TextStyle(
        color: kBlackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
          ),
        ),
      ],
    );
  }
}

