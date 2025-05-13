import 'package:flutter/material.dart';

class Food {
  final String
  name;
  final int
  calories;
  final String
  category;

  Food({
    required this.name,
    required this.calories,
    required this.category,
  });
}

class DailyCalorieCalculator
    extends
        StatefulWidget {
  const DailyCalorieCalculator({
    super.key,
  });

  @override
  State<
    DailyCalorieCalculator
  >
  createState() =>
      _DailyCalorieCalculatorState();
}

class _DailyCalorieCalculatorState
    extends
        State<
          DailyCalorieCalculator
        > {
  // Variables for user input
  final TextEditingController
  _heightController =
      TextEditingController();
  final TextEditingController
  _weightController =
      TextEditingController();
  final TextEditingController
  _ageController =
      TextEditingController();
  String
  _gender =
      'Male';
  double
  dailyCalories =
      0.0;

  // Function to calculate daily calorie requirement based on Mifflin-St Jeor
  void
  calculateDailyCalories() {
    double
    height =
        double.tryParse(
          _heightController.text,
        ) ??
        0.0;
    double
    weight =
        double.tryParse(
          _weightController.text,
        ) ??
        0.0;
    int
    age =
        int.tryParse(
          _ageController.text,
        ) ??
        0;

    if (height >
            0 &&
        weight >
            0 &&
        age > 0) {
      double
      bmr;

      // BMR calculation for male or female
      if (_gender ==
          'Male') {
        bmr =
            (10 *
                weight) +
            (6.25 *
                height) -
            (5 *
                age) +
            5;
      } else {
        bmr =
            (10 *
                weight) +
            (6.25 *
                height) -
            (5 *
                age) -
            161;
      }

      // Total Daily Energy Expenditure (TDEE) based on activity level
      double
      tdee =
          bmr *
          1.2; // Default to sedentary activity level

      setState(() {
        dailyCalories =
            tdee;
      });
    }
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calorie Calculator',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            TextField(
              controller:
                  _heightController,
              keyboardType:
                  TextInputType.number,
              decoration: const InputDecoration(
                labelText:
                    'Height (cm)',
              ),
            ),
            TextField(
              controller:
                  _weightController,
              keyboardType:
                  TextInputType.number,
              decoration: const InputDecoration(
                labelText:
                    'Weight (kg)',
              ),
            ),
            TextField(
              controller:
                  _ageController,
              keyboardType:
                  TextInputType.number,
              decoration: const InputDecoration(
                labelText:
                    'Age (years)',
              ),
            ),
            DropdownButton<
              String
            >(
              value:
                  _gender,
              onChanged: (
                String? newValue,
              ) {
                setState(
                  () {
                    _gender =
                        newValue!;
                  },
                );
              },
              items:
                  <
                    String
                  >[
                    'Male',
                    'Female',
                  ].map<
                    DropdownMenuItem<
                      String
                    >
                  >(
                    (
                      String value,
                    ) {
                      return DropdownMenuItem<
                        String
                      >(
                        value:
                            value,
                        child: Text(
                          value,
                        ),
                      );
                    },
                  ).toList(),
            ),
            ElevatedButton(
              onPressed:
                  calculateDailyCalories,
              child: const Text(
                'Calculate Daily Calories',
              ),
            ),
            if (dailyCalories >
                0)
              Text(
                'Your daily calorie requirement is ${dailyCalories.toStringAsFixed(0)} kcal.',
                style: const TextStyle(
                  fontSize:
                      18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (
                          context,
                        ) => BuildMealScreen(
                          dailyCalories:
                              dailyCalories,
                        ),
                  ),
                );
              },
              child: const Text(
                'Go to Meal Builder',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildMealScreen
    extends
        StatefulWidget {
  final double
  dailyCalories;
  const BuildMealScreen({
    super.key,
    required this.dailyCalories,
  });

  @override
  State<
    BuildMealScreen
  >
  createState() =>
      _BuildMealScreenState();
}

class _BuildMealScreenState
    extends
        State<
          BuildMealScreen
        >
    with
        SingleTickerProviderStateMixin {
  late TabController
  _tabController;

  final List<
    Food
  >
  availableFoods = [
    Food(
      name:
          'Oatmeal',
      calories:
          150,
      category:
          'Main Meal',
    ),
    Food(
      name:
          'Grilled Chicken',
      calories:
          220,
      category:
          'Main Meal',
    ),
    Food(
      name:
          'Boiled Egg',
      calories:
          80,
      category:
          'Main Meal',
    ),
    Food(
      name:
          'Salad',
      calories:
          90,
      category:
          'Main Meal',
    ),
    Food(
      name:
          'Banana',
      calories:
          100,
      category:
          'Dessert',
    ),
    Food(
      name:
          'Orange Juice',
      calories:
          120,
      category:
          'Drink',
    ),
    Food(
      name:
          'Smoothie',
      calories:
          200,
      category:
          'Drink',
    ),
  ];

  final Map<
    String,
    List<
      Food
    >
  >
  selectedFoods = {
    'Breakfast':
        [],
    'Lunch':
        [],
    'Dinner':
        [],
  };

  String
  selectedCategory =
      'Main Meal';

  @override
  void
  initState() {
    super
        .initState();
    _tabController = TabController(
      length:
          3,
      vsync:
          this,
    );
  }

  int
  getTotalCalories(
    String
    mealType,
  ) {
    return selectedFoods[mealType]!.fold(
      0,
      (
        sum,
        item,
      ) =>
          sum +
          item.calories,
    );
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Build Your Meal',
        ),
        bottom: TabBar(
          controller:
              _tabController,
          tabs: const [
            Tab(
              text:
                  'Breakfast',
            ),
            Tab(
              text:
                  'Lunch',
            ),
            Tab(
              text:
                  'Dinner',
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: DropdownButton<
                    String
                  >(
                    value:
                        selectedCategory,
                    onChanged: (
                      String? newValue,
                    ) {
                      setState(
                        () {
                          selectedCategory =
                              newValue!;
                        },
                      );
                    },
                    items:
                        <
                          String
                        >[
                          'Main Meal',
                          'Drink',
                          'Dessert',
                        ].map<
                          DropdownMenuItem<
                            String
                          >
                        >(
                          (
                            String value,
                          ) {
                            return DropdownMenuItem<
                              String
                            >(
                              value:
                                  value,
                              child: Text(
                                value,
                              ),
                            );
                          },
                        ).toList(),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller:
                        _tabController,
                    children:
                        [
                          'Breakfast',
                          'Lunch',
                          'Dinner',
                        ].map(
                          (
                            mealType,
                          ) {
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        availableFoods
                                            .where(
                                              (
                                                food,
                                              ) =>
                                                  food.category ==
                                                  selectedCategory,
                                            )
                                            .toList()
                                            .length,
                                    itemBuilder: (
                                      context,
                                      index,
                                    ) {
                                      final food =
                                          availableFoods
                                              .where(
                                                (
                                                  food,
                                                ) =>
                                                    food.category ==
                                                    selectedCategory,
                                              )
                                              .toList()[index];
                                      return ListTile(
                                        title: Text(
                                          food.name,
                                        ),
                                        subtitle: Text(
                                          '${food.calories} kcal',
                                        ),
                                        onTap: () {
                                          setState(
                                            () {
                                              selectedFoods[mealType]!.add(
                                                food,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  color:
                                      Colors.blue.shade50,
                                  child: Text(
                                    "$mealType Calories: ${getTotalCalories(mealType)} kcal",
                                    style: const TextStyle(
                                      fontSize:
                                          18,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width:
                200,
            padding: const EdgeInsets.all(
              16,
            ),
            color:
                Colors.blue.shade100,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Calories (All Meals)",
                  style: TextStyle(
                    fontSize:
                        20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height:
                      20,
                ),
                Text(
                  "Breakfast: ${getTotalCalories('Breakfast')} kcal",
                  style: const TextStyle(
                    fontSize:
                        16,
                  ),
                ),
                SizedBox(
                  height:
                      10,
                ),
                Text(
                  "Lunch: ${getTotalCalories('Lunch')} kcal",
                  style: const TextStyle(
                    fontSize:
                        16,
                  ),
                ),
                SizedBox(
                  height:
                      10,
                ),
                Text(
                  "Dinner: ${getTotalCalories('Dinner')} kcal",
                  style: const TextStyle(
                    fontSize:
                        16,
                  ),
                ),
                SizedBox(
                  height:
                      20,
                ),
                Text(
                  "Total: ${getTotalCalories('Breakfast') + getTotalCalories('Lunch') + getTotalCalories('Dinner')} kcal",
                  style: const TextStyle(
                    fontSize:
                        18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height:
                      20,
                ),
                Text(
                  "Recommended Daily Calories: ${widget.dailyCalories.toStringAsFixed(0)} kcal",
                  style: const TextStyle(
                    fontSize:
                        16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
