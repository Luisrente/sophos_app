import 'dart:math';

import 'package:flutter/material.dart';

class CustomCardPost extends StatelessWidget {
  final int id;
  final String title;
  final String body;

  const CustomCardPost(
      {super.key, required this.id, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Color> colors = [
      const Color.fromARGB(255, 15, 109, 186),
      const Color.fromARGB(255, 76, 175, 116),
      const Color.fromARGB(255, 236, 45, 125),
      const Color.fromARGB(255, 15, 66, 31),
      const Color.fromARGB(255, 252, 153, 5),
      const Color.fromARGB(255, 126, 11, 203)
    ];
    Random random = Random();
    int randomNumber = random.nextInt(6);
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(
            left: size.height * 0.012, right: size.height * 0.012),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(60, 158, 158, 158)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.012),
                width: size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.012),
                      child: Text(
                        '$id. $title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.012,
                          bottom: size.height * 0.024),
                      child: Text(
                        body,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: colors[randomNumber],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              width: size.width * 0.0764,
            ),
          ],
        ),
      ),
    );
  }
}
