import 'package:flutter/material.dart';
import 'package:wordle/widget/grid.dart';
import 'package:wordle/widget/keyboard.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: const [
          Grid(),
          Spacer(
            flex: 2,
          ),
          Keyboard(),
          Spacer(),
        ],
      ),
    );
  }
}