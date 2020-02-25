import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ranking_challenge/app/modules/home/home_controller.dart';

class ChipWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  final String label;
  final int index;

  ChipWidget(
    this.label,
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      selected: controller.tabIndex == index,
      onSelected: (_) => controller.changeIndex(index),
      backgroundColor: Theme.of(context).backgroundColor,
      selectedColor: Color(0xff4E7A6D),
      shape: StadiumBorder(
        side: BorderSide(
          color: Theme.of(context).backgroundColor,
          width: 0,
        ),
      ),
    );
  }
}
