import 'package:animation_helpers/animation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:ranking_challenge/app/shared/widgets/name_initials_widget.dart';

import '../position_model.dart';

class TopThreeWidget extends StatelessWidget {
  final List<PositionModel> topThree;
  final interpolation = InterpolationController(begin: 450, end: 170);

  TopThreeWidget(this.topThree, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // bool showInfo = constraints.maxHeight > 300;
      return FittedBox(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 40),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: interpolation.linear(constraints.maxHeight, begin: 170, end: 240),
                  top: interpolation.linear(constraints.maxHeight, begin: 70, end: 30),
                ),
                child: _buildCircleAvatar(
                  position: 2,
                  name: topThree[1].name,
                  points: topThree[1].points,
                  showInfo: interpolation.linear(constraints.maxHeight, begin: 1, end: 0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: interpolation.linear(constraints.maxHeight, begin: 170, end: 240),
                  top: interpolation.linear(constraints.maxHeight, begin: 70, end: 30),
                ),
                child: _buildCircleAvatar(
                  position: 3,
                  name: topThree[2].name,
                  points: topThree[2].points,
                  showInfo: interpolation.linear(constraints.maxHeight, begin: 1, end: 0),
                ),
              ),
              _buildCircleAvatar(
                name: topThree[0].name,
                points: topThree[0].points,
                showInfo: interpolation.linear(constraints.maxHeight, begin: 1, end: 0),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildCircleAvatar({
    int position = 1,
    String name = '@name',
    int points = 0,
    double showInfo = 1,
  }) =>
      Column(
        children: <Widget>[
          Text(
            '$position',
            style: TextStyle(color: Colors.white),
          ),
          position == 1
              ? Image.network(
                  'https://pngimg.com/uploads/crown/crown_PNG18.png',
                  height: 40,
                  width: 50,
                )
              : Icon(
                  position == 2 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: position == 1
                      ? Colors.yellow
                      : position == 2
                          ? Color(0xff0CFAC8)
                          : Colors.white,
                  size: position == 1 ? 35 : 30,
                ),
          SizedBox(height: 10),
          Container(
            decoration: position == 1
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff0CFAC8),
                        spreadRadius: 5,
                        blurRadius: 30,
                      ),
                    ],
                  )
                : null,
            child: CircleAvatar(
              radius: position == 1 ? 60 : 50,
              backgroundColor: Color(0xff0CFAC8),
              child: CircleAvatar(
                radius: position == 1 ? 57 : 47,
                backgroundColor: Colors.white,
                child: NameInitialsWidget(text: name),
              ),
            ),
          ),
          Opacity(
            opacity: showInfo,
            child: ClipRRect(
              child: Align(
                heightFactor: showInfo,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 70,
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$points',
            style: TextStyle(
              color: Color(0xff0CFAC8),
            ),
          ),
        ],
      );
}
