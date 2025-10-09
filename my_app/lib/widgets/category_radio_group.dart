import 'package:flutter/material.dart';

class CategoryRadioGroup extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onChanged;

  const CategoryRadioGroup({
    Key? key,
    required this.selectedCategory,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ['Electronics', 'Furniture', 'Clothing'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        ...categories.map((category) => RadioListTile<String>(
          title: Text(category),
          value: category,
          groupValue: selectedCategory,
          onChanged: (value) => onChanged(value!),
        )),
      ],
    );
  }
}