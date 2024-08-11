class SaleModel {
  final String itemName;
  final double price;

  SaleModel({required this.itemName, required this.price});

  factory SaleModel.fromJson(Map<String, dynamic> json) {
    return SaleModel(
      itemName: json['itemName'],
      price: json['price'],
    );
  }
}
