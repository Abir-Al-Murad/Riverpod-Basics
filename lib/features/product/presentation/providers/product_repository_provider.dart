import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/features/product/data/product_repository.dart';
import 'package:my_riverpod_app/features/product/domain/product_repository_impl.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl();
});
