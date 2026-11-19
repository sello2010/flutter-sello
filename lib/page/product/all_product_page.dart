import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product/product_cubit.dart';
import '../../core/components/product_card.dart';
import '../../resource/remote/home_remote_resource.dart';

/// Halaman daftar semua produk dengan paging (tombol "Load More").
/// ProductCubit disediakan langsung oleh halaman ini, jadi tidak perlu
/// mengubah router.
class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductCubit(HomeRemoteResource())..fetchProduct(isRefresh: true),
      child: const _AllProductView(),
    );
  }
}

class _AllProductView extends StatefulWidget {
  const _AllProductView();

  @override
  State<_AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<_AllProductView> {
  bool _isLoadingMore = false;

  void _loadMore() {
    setState(() => _isLoadingMore = true);
    context.read<ProductCubit>().fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'All Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // Tombol Load More aktif lagi setelah data baru masuk / gagal
          if (state is ProductLoaded || state is ProductError) {
            if (_isLoadingMore) setState(() => _isLoadingMore = false);
          }
        },
        builder: (context, state) {
          if (state is ProductLoaded) {
            return _buildList(state);
          }
          if (state is ProductError) {
            return _buildError(state.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildList(ProductLoaded state) {
    if (state.products.isEmpty) {
      return const Center(child: Text('Tidak ada data tersedia'));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // satu item tambahan di akhir untuk tombol Load More
      itemCount: state.products.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.products.length) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(50, 8, 50, 16),
            child: FilledButton(
              onPressed: _isLoadingMore ? null : _loadMore,
              style: FilledButton.styleFrom(backgroundColor: Colors.orange),
              child: _isLoadingMore
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Load More',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          );
        }
        return ProductCard(
          product: state.products[index],
          isPopular: false,
        );
      },
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Gagal memuat produk'),
            const SizedBox(height: 4),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            TextButton(
              onPressed: () =>
                  context.read<ProductCubit>().fetchProduct(isRefresh: true),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}