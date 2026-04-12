import 'package:my_riverpod_app/features/product/domain/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchProducts();
}