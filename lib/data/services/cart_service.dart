class CartService {
  CartService._internal();
  static final _instance = CartService._internal();
  factory CartService() => _instance;
  void addItem() {}
  void removeItem() {}
  void readItems() {}
}
