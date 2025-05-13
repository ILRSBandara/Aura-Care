import 'package:flutter/material.dart';

class Food {
  final String
  name;
  final int
  calories;
  final String
  category; // New category property

  Food({
    required this.name,
    required this.calories,
    required this.category,
  });
}

class BuildMealScreen
    extends
        StatefulWidget {
  const BuildMealScreen({
    super.key,
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
      'Main Meal'; // Default category

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
    ); // Create TabController
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
              _tabController, // Use TabController for TabBar
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
                // Category Selector
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
                // Filtered food list based on selected category
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
                                      final isSelected = selectedFoods[mealType]!.contains(
                                        food,
                                      );

                                      return ListTile(
                                        title: Text(
                                          food.name,
                                        ),
                                        subtitle: Text(
                                          '${food.calories} kcal',
                                        ),
                                        trailing:
                                            isSelected
                                                ? const Icon(
                                                  Icons.check,
                                                  color:
                                                      Colors.green,
                                                )
                                                : const Icon(
                                                  Icons.add,
                                                ),
                                        onTap: () {
                                          setState(
                                            () {
                                              if (isSelected) {
                                                selectedFoods[mealType]!.remove(
                                                  food,
                                                );
                                              } else {
                                                selectedFoods[mealType]!.add(
                                                  food,
                                                );
                                              }
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void
  dispose() {
    _tabController
        .dispose();
    super
        .dispose();
  }
}
