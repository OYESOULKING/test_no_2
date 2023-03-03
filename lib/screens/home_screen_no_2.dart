import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_no_2/custom_painter/custom_painter_no_2.dart';

class HomeScreenNo2 extends StatefulWidget {
  const HomeScreenNo2({super.key});

  @override
  State<HomeScreenNo2> createState() => _HomeScreenNo2State();
}

class _HomeScreenNo2State extends State<HomeScreenNo2> {
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, boxConstraints) {
              return SizedBox(
                height: boxConstraints.maxHeight,
                width: boxConstraints.maxWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPaint(
                    painter: MyCustomPainterNo2(dateTime),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
