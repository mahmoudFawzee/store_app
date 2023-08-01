import 'package:store_app/data/services/base/base_service.dart';

class ProductService extends BaseService {
  ProductService._internal();
  static final _productService = ProductService._internal();
  factory ProductService() => _productService;

  @override
  Future<bool> create() async {
    return true;
  }

  @override
  Future<bool> delete() {
    throw UnimplementedError();
  }

  @override
  Future<List> read() async {
    return [];
  }

  @override
  Future<bool> update() async {
    return false;
  }
}
