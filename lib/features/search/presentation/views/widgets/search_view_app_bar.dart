import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey, // Border color
            width: 1.5, // Border thickness
          ),
        ),
        child: Row(
          children: [
            // Search TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none, // Removes default border
                  ),
                ),
              ),
            ),
            // Search Icon
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.search,
                color: Colors.grey, // Icon color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
