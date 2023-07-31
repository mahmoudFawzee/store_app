class ProductService {
  ProductService._internal();
  static final _productService = ProductService._internal();
  factory ProductService() => _productService;
  void addProduct() {}
  void removeProduct() {}
  void updateProduct() {}
  void readProduct() {}
}
