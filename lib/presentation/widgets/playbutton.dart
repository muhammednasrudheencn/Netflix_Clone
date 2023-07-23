import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
backgroundColor: MaterialStateProperty.all(kWhiteColor),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(12),
    
    )
  ),),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.only(right: 10,left: 5),
          child: Text(
            "Play",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: kBlackColor,
            ),
          ),
        ));
  }
}
