import 'package:flutter/material.dart';
import './main.dart';

class CategoryMealsScreens extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String CategoryTitle;

  // CategoryMealsScreens(this.categoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){

      }),
    );
  }
}
