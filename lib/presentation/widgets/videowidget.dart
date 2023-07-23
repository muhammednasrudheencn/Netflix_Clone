import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String? videoImage;
  const VideoWidget({
    super.key,
    this.videoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.network(
              '$videoImage',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
                size: 22,
              ),
            ),
          ),
        )
      ],
    );
  }
}
