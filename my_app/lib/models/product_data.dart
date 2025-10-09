class ProductData {
  final String name;
  final String serial;
  final double price;
  final String category;

  ProductData({
    required this.name,
    required this.serial,
    required this.price,
    required this.category,
  });

  Map<String, String> toMap() {
    return {
      'Product Name': name,
      'Serial Number': serial,
      'Price': price.toStringAsFixed(2),
      'Category': category,
    };
  }

  factory ProductData.fromControllers({
    required String name,
    required String serial,
    required String price,
    required String category,
  }) {
    return ProductData(
      name: name,
      serial: serial,
      price: double.tryParse(price) ?? 0.0,
      category: category,
    );
  }
}