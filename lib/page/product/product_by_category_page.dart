import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/category_products/category_products_cubit.dart';
import '../../core/components/product_card.dart';
import '../../resource/model/category_model.dart';
import '../../resource/remote/home_remote_resource.dart';

/// Daftar produk berdasarkan kategori. CategoryProductsCubit disediakan
/// langsung oleh halaman ini, jadi tidak perlu mengubah router.
class ProductByCategoryPage extends StatelessWidget {
  final CategoryModel category;

  const ProductByCategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryProductsCubit(HomeRemoteResource())
        ..fetchByCategory(category.slug),
      child: _ProductByCategoryView(category: category),
    );
  }
}

class _ProductByCategoryView extends StatelessWidget {
  final CategoryModel category;

  const _ProductByCategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Product In ${category.name}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsLoaded) {
            final products = state.data.products;
            if (products.isEmpty) {
              return const Center(child: Text('Product not found'));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  isPopular: false,
                );
              },
            );
          }
          if (state is CategoryProductsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Gagal memuat produk'),
                    const SizedBox(height: 4),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () => context
                          .read<CategoryProductsCubit>()
                          .fetchByCategory(category.slug),
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}