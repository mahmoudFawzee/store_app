import 'package:store_app/data/services/base/base_service.dart';

class CartService extends BaseService{
  CartService._internal();
  static final _instance = CartService._internal();
  factory CartService() => _instance;
  
  @override
  create() {
    // TODO: implement create
    throw UnimplementedError();
  }
  
  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  read() {
    // TODO: implement read
    throw UnimplementedError();
  }
  
  @override
  update() {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}
