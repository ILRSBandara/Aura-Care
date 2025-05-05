import 'package:aura_care/Screen/common_widget/round_button.dart';
import 'package:aura_care/Screen/workout/workout_detail_view.dart';
import 'package:flutter/material.dart';

class WorkoutView
    extends
        StatefulWidget {
  const WorkoutView({
    super.key,
  });

  @override
  State<
    WorkoutView
  >
  createState() =>
      _WorkoutViewState();
}

class _WorkoutViewState
    extends
        State<
          WorkoutView
        > {
  List
  workArr = [
    {
      "name":
          "Climber",
      "image":
          "assets/Images/1.png",
      "title":
          "workout",
      "subtitle":
          "Personalized workouts will help\nyou gain strength",
    },
    {
      "name":
          "Climber",
      "image":
          "assets/Images/1.png",
      "title":
          "workout",
      "subtitle":
          "Personalized workouts will help\nyou gain strength",
    },
    {
      "name":
          "Climber",
      "image":
          "assets/Images/1.png",
      "title":
          "workout",
      "subtitle":
          "Personalized workouts will help\nyou gain strength",
    },
    {
      "name":
          "Climber",
      "image":
          "assets/Images/1.png",
      "title":
          "workout",
      "subtitle":
          "Personalized workouts will help\nyou gain strength",
    },
  ];

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    var media = MediaQuery.sizeOf(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.white,
        centerTitle:
            true,
        elevation:
            0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Image.asset(
            "assets/Images/1.png",
            width:
                25,
            height:
                25,
          ),
        ),
        title: Text(
          "Workout",
          style: TextStyle(
            color:
                Colors.blue,
            fontSize:
                20,
            fontWeight:
                FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical:
              15,
          horizontal:
              20,
        ),
        itemCount:
            workArr.length,
        itemBuilder: (
          context,
          index,
        ) {
          var wObj =
              workArr[index]
                  as Map? ??
              {};
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical:
                  10,
            ),
            height:
                media.width *
                0.5,
            decoration: BoxDecoration(
              color:
                  Colors.grey,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            clipBehavior:
                Clip.antiAlias,
            child: Stack(
              children: [
                Image.asset(
                  wObj["image"].toString(),
                  width:
                      media.width,
                  height:
                      media.width *
                      0.5,
                  fit:
                      BoxFit.cover,
                ),
                Container(
                  width:
                      media.width,
                  height:
                      media.width *
                      0.5,
                  decoration: BoxDecoration(
                    color:
                        index %
                                    2 ==
                                0
                            ? Colors.black.withOpacity(
                              0.7,
                            )
                            : Colors.grey.withOpacity(
                              0.35,
                            ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical:
                        25,
                    horizontal:
                        20,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        wObj["title"],
                        style: TextStyle(
                          color:
                              Colors.blue,
                          fontSize:
                              14,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                      Text(
                        wObj["name"],
                        style: TextStyle(
                          color:
                              Colors.white,
                          fontSize:
                              20,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),
                      Text(
                        wObj["subtitle"],
                        style: TextStyle(
                          color:
                              Colors.white,
                          fontSize:
                              14,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width:
                                100,
                            height:
                                25,
                            child: RoundButton(
                              title:
                                  "see more",
                              fontSize:
                                  14,
                              fontWeight:
                                  FontWeight.w500,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (
                                          context,
                                        ) =>
                                            const WorkoutDetailView(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation:
            1,
        child: Padding(
          padding: const EdgeInsets.only(
            top:
                15,
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap:
                    () {},
                child: Image.asset(
                  "assets/Images/1.png",
                  width:
                      25,
                  height:
                      25,
                ),
              ),
              InkWell(
                onTap:
                    () {},
                child: Image.asset(
                  "assets/Images/1.png",
                  width:
                      25,
                  height:
                      25,
                ),
              ),
              InkWell(
                onTap:
                    () {},
                child: Image.asset(
                  "assets/Images/1.png",
                  width:
                      25,
                  height:
                      25,
                ),
              ),
              InkWell(
                onTap:
                    () {},
                child: Image.asset(
                  "assets/Images/1.png",
                  width:
                      25,
                  height:
                      25,
                ),
              ),
              InkWell(
                onTap:
                    () {},
                child: Image.asset(
                  "assets/Images/1.png",
                  width:
                      25,
                  height:
                      25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
