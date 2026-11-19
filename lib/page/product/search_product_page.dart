import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product/product_cubit.dart';
import '../../core/components/product_card.dart';
import '../../resource/remote/home_remote_resource.dart';

/// Halaman hasil pencarian produk. ProductCubit disediakan di sini,
/// jadi cukup dibuka lewat Navigator.push.
class SearchProductPage extends StatelessWidget {
  final String query;

  const SearchProductPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(HomeRemoteResource())
        ..fetchProduct(isRefresh: true, query: query),
      child: _SearchView(query: query),
    );
  }
}

class _SearchView extends StatefulWidget {
  final String query;

  const _SearchView({required this.query});

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  bool _isLoadingMore = false;

  void _loadMore() {
    setState(() => _isLoadingMore = true);
    // query dikirim lagi supaya halaman berikutnya tetap terfilter
    context.read<ProductCubit>().fetchProduct(query: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Search', style: TextStyle(color: Colors.white)),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductLoaded || state is ProductError) {
            if (_isLoadingMore) setState(() => _isLoadingMore = false);
          }
        },
        builder: (context, state) {
          if (state is ProductLoaded) return _buildList(state);
          if (state is ProductError) return _buildError(state.message);
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildList(ProductLoaded state) {
    if (state.products.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Produk "${widget.query}" tidak ditemukan',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
              onPressed: () => context
                  .read<ProductCubit>()
                  .fetchProduct(isRefresh: true, query: widget.query),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}