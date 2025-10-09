import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final dynamic data; // Accepts both UserData and ProductData

  const ResultDialog({
    Key? key,
    required this.data,
  }) : super(key: key);

  static void show(BuildContext context, dynamic data) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ResultDialog(data: data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Form Submitted Successfully'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.from( // ✅ Explicit cast to List<Widget>
          data.toMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('${entry.key}: ${entry.value}'),
            );
          }),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}