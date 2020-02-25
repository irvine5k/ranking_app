import 'package:flutter/material.dart';
import 'package:ranking_challenge/app/shared/widgets/name_initials_widget.dart';

import '../position_model.dart';

class RankingTileWidget extends StatelessWidget {
  final int index;
  final PositionModel person;

  const RankingTileWidget(
    this.index,
    this.person, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$index',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  person.up ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: person.up ? Color(0xff0CFAC8) : Colors.white,
                  size: 25,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 60, right: 20),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xff4E7A6D),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          person.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${person.points}',
                        style: TextStyle(
                          color: Color(0xff0CFAC8),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: NameInitialsWidget(
                    text: person.name,
                    margin: 0,
                    size: 55,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
