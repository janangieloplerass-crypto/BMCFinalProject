import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;

  final TextInputType keyboardType;
  final String? Function(String?) validator;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
class GenderRadioGroup extends StatelessWidget {
  final String selectedGender;
  final Function(String) onChanged;
  const GenderRadioGroup({
    Key? key,

    required this.selectedGender,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        RadioListTile<String>(
          title: const Text('Male'),
          value: 'Male',
          groupValue: selectedGender,
          onChanged: (value) => onChanged(value!),
        ),
        RadioListTile<String>(
          title: const Text('Female'),
          value: 'Female',
          groupValue: selectedGender,
          onChanged: (value) => onChanged(value!),
        ),
      ],
    );
  }
}