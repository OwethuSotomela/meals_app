import 'package:flutter/material.dart';

class CategoryMealsScreens extends StatelessWidget {
  final String categoryId;
  final String CategoryTitle;

  CategoryMealsScreens(this.categoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: Center(
        child: Text('The Recipes For The Coordinates!'),
      ),
    );
  }
}
