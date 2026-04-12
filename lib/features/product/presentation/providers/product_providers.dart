import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/features/product/domain/product_model.dart';
import 'package:my_riverpod_app/features/product/presentation/providers/product_repository_provider.dart';

final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProducts();
});
