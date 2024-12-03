import 'package:flutter/material.dart';

class BookDetailsTwoButtons extends StatelessWidget {
  const BookDetailsTwoButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {
                print("Free Preview button pressed");
              },
              child: const Text(
                'Click here to preview',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
