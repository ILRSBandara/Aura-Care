import 'package:flutter/material.dart';

class Food {
  final String name;
  final int calories;
  final String category;
  final String amount;

  Food({
    required this.name,
    required this.calories,
    required this.category,
    required this.amount,
  });
}

class BuildMealScreen extends StatefulWidget {
  final double dailyCalories;
  const BuildMealScreen({super.key, required this.dailyCalories});

  @override
  State<BuildMealScreen> createState() => _BuildMealScreenState();
}

class _BuildMealScreenState extends State<BuildMealScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Food> availableFoods = [

    Food(
      name: 'Fish and Chips',
      calories: 800,
      category: 'Main Meal',
      amount: '400g',
    ),
    Food(
      name: 'Shepherd’s Pie',
      calories: 450,
      category: 'Main Meal',
      amount: '300g',
    ),
    Food(
      name: 'Roast Beef',
      calories: 500,
      category: 'Main Meal',
      amount: '250g',
    ),
    Food(
      name: 'Chicken Tikka Masala',
      calories: 550,
      category: 'Main Meal',
      amount: '350g',
    ),
    Food(
      name: 'Bangers and Mash',
      calories: 600,
      category: 'Main Meal',
      amount: '350g',
    ),
    Food(
      name: 'Full English Breakfast',
      calories: 700,
      category: 'Main Meal',
      amount: '450g',
    ),
    Food(
      name: 'Steak and Kidney Pie',
      calories: 520,
      category: 'Main Meal',
      amount: '300g',
    ),
    Food(
      name: 'Cottage Pie',
      calories: 470,
      category: 'Main Meal',
      amount: '300g',
    ),
    Food(
      name: 'Sunday Roast',
      calories: 650,
      category: 'Main Meal',
      amount: '400g',
    ),
    Food(
      name: 'Toad in the Hole',
      calories: 480,
      category: 'Main Meal',
      amount: '280g',
    ),
    Food(
      name: 'Cornish Pasty',
      calories: 450,
      category: 'Main Meal',
      amount: '300g',
    ),
    Food(
      name: 'Ploughman’s Lunch',
      calories: 400,
      category: 'Main Meal',
      amount: '350g',
    ),
    Food(
      name: 'Jacket Potato with Beans',
      calories: 360,
      category: 'Main Meal',
      amount: '350g',
    ),
    Food(
      name: 'Chicken and Leek Pie',
      calories: 520,
      category: 'Main Meal',
      amount: '330g',
    ),
    Food(
      name: 'Lamb Stew',
      calories: 540,
      category: 'Main Meal',
      amount: '360g',
    ),
    Food(
      name: 'Beef Wellington',
      calories: 600,
      category: 'Main Meal',
      amount: '300g',
    ),
    Food(
      name: 'Pork Pie',
      calories: 450,
      category: 'Main Meal',
      amount: '250g',
    ),
    Food(
      name: 'Haggis with Neeps and Tatties',
      calories: 500,
      category: 'Main Meal',
      amount: '350g',
    ),
    Food(
      name: 'Scotch Egg and Salad',
      calories: 380,
      category: 'Main Meal',
      amount: '280g',
    ),
    Food(
      name: 'Welsh Rarebit',
      calories: 350,
      category: 'Main Meal',
      amount: '250g',
    ),

    // Drinks (10)
    Food(
      name: 'Tea with Milk',
      calories: 30,
      category: 'Drink',
      amount: '200ml',
    ),
    Food(name: 'Black Tea', calories: 0, category: 'Drink', amount: '200ml'),
    Food(
      name: 'English Breakfast Tea',
      calories: 5,
      category: 'Drink',
      amount: '200ml',
    ),
    Food(
      name: 'Hot Chocolate',
      calories: 190,
      category: 'Drink',
      amount: '250ml',
    ),
    Food(
      name: 'Fruit Smoothie',
      calories: 180,
      category: 'Drink',
      amount: '300ml',
    ),
    Food(name: 'Lemonade', calories: 120, category: 'Drink', amount: '250ml'),
    Food(
      name: 'Orange Juice',
      calories: 110,
      category: 'Drink',
      amount: '250ml',
    ),
    Food(
      name: 'Apple Juice',
      calories: 115,
      category: 'Drink',
      amount: '250ml',
    ),
    Food(name: 'Milkshake', calories: 250, category: 'Drink', amount: '300ml'),
    Food(
      name: 'Sparkling Water',
      calories: 0,
      category: 'Drink',
      amount: '300ml',
    ),

    // Desserts (10)
    Food(
      name: 'Sticky Toffee Pudding',
      calories: 450,
      category: 'Dessert',
      amount: '150g',
    ),
    Food(
      name: 'Spotted Dick',
      calories: 420,
      category: 'Dessert',
      amount: '160g',
    ),
    Food(
      name: 'Treacle Tart',
      calories: 390,
      category: 'Dessert',
      amount: '150g',
    ),
    Food(name: 'Eton Mess', calories: 320, category: 'Dessert', amount: '140g'),
    Food(name: 'Trifle', calories: 350, category: 'Dessert', amount: '150g'),
    Food(
      name: 'Victoria Sponge Cake',
      calories: 380,
      category: 'Dessert',
      amount: '150g',
    ),
    Food(
      name: 'Rhubarb Crumble',
      calories: 370,
      category: 'Dessert',
      amount: '150g',
    ),
    Food(
      name: 'Jam Roly-Poly',
      calories: 410,
      category: 'Dessert',
      amount: '160g',
    ),
    Food(
      name: 'Custard Tart',
      calories: 330,
      category: 'Dessert',
      amount: '140g',
    ),
    Food(
      name: 'Scone with Cream and Jam',
      calories: 310,
      category: 'Dessert',
      amount: '130g',
    ),
  ];

  final Map<String, List<Food>> selectedFoods = {
    'Breakfast': [],
    'Lunch': [],
    'Dinner': [],
  };

  String selectedCategory = 'Main Meal';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  int getTotalCalories(String mealType) {
    return selectedFoods[mealType]!.fold(0, (sum, item) => sum + item.calories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Your Meal'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Breakfast'),
            Tab(text: 'Lunch'),
            Tab(text: 'Dinner'),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items:
                        <String>['Main Meal', 'Drink', 'Dessert'].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children:
                        ['Breakfast', 'Lunch', 'Dinner'].map((mealType) {
                          final filteredFoods =
                              availableFoods
                                  .where((f) => f.category == selectedCategory)
                                  .toList();
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: filteredFoods.length,
                                  itemBuilder: (context, index) {
                                    final food = filteredFoods[index];
                                    return ListTile(
                                      title: Text(food.name),
                                      subtitle: Text(
                                        '${food.calories} kcal • ${food.amount}',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedFoods[mealType]!.add(food);
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                color: Colors.blue.shade50,
                                child: Text(
                                  "$mealType Calories: ${getTotalCalories(mealType)} kcal",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Calories (All Meals)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text("Breakfast: ${getTotalCalories('Breakfast')} kcal"),
                Text("Lunch: ${getTotalCalories('Lunch')} kcal"),
                Text("Dinner: ${getTotalCalories('Dinner')} kcal"),
                const SizedBox(height: 20),
                Text(
                  "Total: ${getTotalCalories('Breakfast') + getTotalCalories('Lunch') + getTotalCalories('Dinner')} kcal",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "Recommended: ${widget.dailyCalories.toStringAsFixed(0)} kcal",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
