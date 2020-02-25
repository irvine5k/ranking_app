import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ranking_challenge/app/modules/home/home_controller.dart';
import 'package:ranking_challenge/app/shared/widgets/name_initials_widget.dart';

import '../../app_controller.dart';
import 'chip/chip_widget.dart';
import 'position_model.dart';
import 'ranking_tile/ranking_tile_widget.dart';
import 'top_three/top_three_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
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
          onPressed: () => controller.logout(context),
        ),
      ),
      body: AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          return ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff002619),
                  // (scrollController.offset < 50)
                  //     ? Color(0xff002619)
                  //     : Colors.transparent,
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ChipWidget('Today', 0),
                    ChipWidget('Week', 1),
                    ChipWidget('Month', 2),
                  ],
                );
              },
            ),
            Observer(
              builder: (context) => Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 450,
                      flexibleSpace: TopThreeWidget(controller.persons),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(150),
                        child: Container(),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index < 3) {
                            return Container();
                          }

                          // return RankingTileWidget(
                          //   index + 1,
                          //   controller.persons[index],
                          // );
                          return RankingTileWidget(
                              index + 1,
                              PositionModel(
                                  id: "0", name: "Wallace", points: 500));
                        },
                        childCount: 50, //controller.persons?.length ?? 0,
                        // ListView.builder(
                        //       controller: scrollController,
                        //       itemCount: controller.persons?.length ?? 0,
                        //       shrinkWrap: true,
                        //       physics: NeverScrollableScrollPhysics(),
                        //     )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
