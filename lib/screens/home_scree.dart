import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_no_2/custom_painter/custom_painter_no_1.dart';

class HomeScree extends StatefulWidget {
  const HomeScree({super.key});

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          return SizedBox(
            height: boxConstraints.maxHeight,
            width: boxConstraints.maxWidth,
            child: CustomPaint(
              painter: MyCustomPainterNo1(),
            ),
          );
        },
      ),
    );
  }
}
