import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Widget buildWidgetCard(String e, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 32,
      ),
      height: 32,
      width: double.infinity,
      child: Text(e),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    print(mealId);
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId['id']);

    List<Widget> _ingredientsWidget = selectedMeal.ingredients.map((e) {
      return buildWidgetCard("- ${e}", context);
    }).toList();

    List<Widget> _stepsWidget = selectedMeal.steps.map((e) {
      int index = selectedMeal.steps.indexOf(e);

      return buildWidgetCard("${index + 1} - ${e}", context);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ExpansionTile(
              title: Text("Ingredients"),
              children: _ingredientsWidget,
            ),
            ExpansionTile(
              title: Text("Steps"),
              children: _stepsWidget,
            )
            /*
            * Card(
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
            *
            *
            * */

            /*buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  Divider(),
                ]),
                itemCount: selectedMeal.steps.length,
              ),
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.delete,
          ),
          onPressed: () {
            Navigator.of(context).pop(mealId);
          }),
    );
  }
}
