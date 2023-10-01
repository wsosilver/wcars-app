import 'package:flutter/material.dart';
import 'package:wcars/app/modules/vitrine/vitrine_controller.dart';

class VitrinePage extends StatefulWidget {
  const VitrinePage({Key? key}) : super(key: key);

  @override
  State<VitrinePage> createState() => VitrinePageState();
}

class VitrinePageState extends State<VitrinePage> {
  final controller = VitrineController();

  @override
  void initState() {
    controller.ini();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeContainerHeight = (MediaQuery.of(context).size.height);
    final sizeContainerWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
        body: SizedBox(
      height: sizeContainerHeight,
      width: sizeContainerWidth,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Text('Vitrine'),
          ),
        ],
      ),
    ));
  }
}
