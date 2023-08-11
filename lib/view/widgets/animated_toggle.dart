import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:richpanel/controller/controller.dart';
import 'package:richpanel/utils/themes.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  List<bool> isSelected = [true, false];
  final controller = Get.put(RichPanelController());

  @override
  Widget build(BuildContext context) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: RichPanelTheme.primaryColor,
        renderBorder: false,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Monthly', style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Yearly', style: TextStyle(fontSize: 18)),
          ),
        ],
        onPressed: (int newIndex) {
          controller.package.value = newIndex;

          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newIndex) {
                isSelected[index] = true;
              } else {
                isSelected[index] = false;
              }
            }
          });
        },
      );
}
