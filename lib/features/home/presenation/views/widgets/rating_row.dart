import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        SizedBox(
          width: 4,
        ),
        Text("4.8"),
        SizedBox(
          width: 4,
        ),
        Text("(231)"),
        SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
