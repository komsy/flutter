class ProductVariationModel {
  final String id;
  String sku; //nullable
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id, 
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  //Create empty Fun
  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  //JSON Format
  toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributesValues': attributeValues,
    };
  }

  //Map Json oriented document snapshot from Firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return ProductVariationModel.empty();

      //Map JSON record to the model
      return ProductVariationModel(
        id: data['Id'] ?? '', 
        price: double.parse((data['Price'] ?? 0.0).toString()), 
        sku: data['SKU'] ?? '', 
        stock: data['Stock'] ?? '', 
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()), 
        image: data['Image'] ?? '',
        attributeValues: Map<String, String>.from(data['AttributeValues'])
      );
  }
}