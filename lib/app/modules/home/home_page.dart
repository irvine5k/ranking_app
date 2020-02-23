import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ranking_challenge/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  ScrollController _scrollController;

  Widget _buildChip(String label, int index) => ChoiceChip(
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

  Widget _buildCircleAvatar({
    int position = 1,
    String name = '@name',
    int points = 0,
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
                      : position == 2 ? Color(0xff0CFAC8) : Colors.white,
                  size: position == 1 ? 35 : 30,
                ),
          SizedBox(
            height: 10,
          ),
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
                backgroundColor: Theme.of(context).backgroundColor,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/DaUamWNX0AAxLKy.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: 80,
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
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

  Widget buildRankingTile(
    int index,
    BuildContext context,
    Person person,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Text(
                  '$index',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  person.lastPosition < index
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: person.lastPosition < index
                      ? Color(0xff0CFAC8)
                      : Colors.white,
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
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/media/DaUamWNX0AAxLKy.jpg',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Leaderboard'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) => ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                _scrollController.offset < 50
                    ? Color(0xff002619)
                    : Colors.transparent,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: child,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildChip('Today', 0),
                    _buildChip('Week', 1),
                    _buildChip('Month', 2),
                  ],
                );
              },
            ),
            Observer(
              builder: (context) => Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: controller.persons.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return buildTopThree(
                        context,
                        controller.persons,
                      );
                    }

                    if (index < 4) {
                      return Container();
                    }

                    return buildRankingTile(
                      index,
                      context,
                      controller.persons[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTopThree(BuildContext context, List<Person> topThree) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 40),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 170, top: 60),
            child: _buildCircleAvatar(
              position: 2,
              name: topThree[1].name,
              points: topThree[1].points,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 170, top: 60),
            child: _buildCircleAvatar(
              position: 3,
              name: topThree[2].name,
              points: topThree[2].points,
            ),
          ),
          _buildCircleAvatar(
            name: topThree[0].name,
            points: topThree[0].points,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
