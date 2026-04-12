import 'package:my_riverpod_app/features/product/data/product_repository.dart';
import 'package:my_riverpod_app/features/product/domain/product_model.dart';

class ProductRepositoryImpl  extends ProductRepository{
  @override
  Future<List<ProductModel>> fetchProducts()async {
    return Future.delayed(Duration(seconds: 4), () => dummyProducts);
  }
}

List<ProductModel> dummyProducts = [
  ProductModel(name: "Product 1", description: "Description 1", price: 10.0),
  ProductModel(name: "Product 2", description: "Description 2", price: 20.0),
  ProductModel(name: "Product 3", description: "Description 3", price: 30.0),
];