import 'package:flutter/material.dart';

class NameInitialsWidget extends StatelessWidget {
  final double size;
  final String text;
  final double fontSize;
  final double margin;

  const NameInitialsWidget({
    Key key,
    this.size = 50,
    @required this.text,
    this.fontSize = 22,
    this.margin = 8,
  }) : super(key: key);

  _getInitials() {
    return this
        .text
        .split(" ")
        .where((t) => t.isEmpty ? false : true)
        .map((nome) {
          return nome.isEmpty ? " " : nome.substring(0, 1).toUpperCase();
        })
        .join()
        .substring(0, (this.text.split(" ").length < 2) ? 1 : 2)
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      alignment: Alignment.center,
      margin: this.margin != null ? EdgeInsets.all(this.margin) : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Text(
        _getInitials(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title.copyWith(
            color: Theme.of(context).primaryColor, fontSize: this.fontSize),
      ),
    );
  }
}
