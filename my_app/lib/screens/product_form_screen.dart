import 'package:flutter/material.dart';
import '../models/product_data.dart';
import '../widgets/form_fields.dart';
import '../widgets/result_dialog.dart';
import '../widgets/category_radio_group.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _serialController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedCategory = 'Electronics';

  @override
  void dispose() {
    _nameController.dispose();
    _serialController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final product = ProductData.fromControllers(
        name: _nameController.text,
        serial: _serialController.text,
        price: _priceController.text,
        category: _selectedCategory,
      );
      ResultDialog.show(context, product);
    }
  }

  String? _validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter price';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Enter a valid positive price';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Registration Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: _nameController,
                labelText: 'Product Name',
                prefixIcon: Icons.label,
                validator: (value) => _validateNotEmpty(value, 'product name'),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: _serialController,
                labelText: 'Serial Number',
                prefixIcon: Icons.confirmation_number,
                validator: (value) => _validateNotEmpty(value, 'serial number'),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: _priceController,
                labelText: 'Price',
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                validator: _validatePrice,
              ),
              const SizedBox(height: 16),
              CategoryRadioGroup(
                selectedCategory: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}