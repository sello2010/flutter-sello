import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/product_detail/product_detail_cubit.dart';
import '../../core/constants/app_config.dart';
import '../../core/utils/currency_helper.dart';
import '../../resource/model/product_model.dart';
import '../../resource/remote/home_remote_resource.dart';

/// Halaman detail produk. Dibuka dengan slug produk, datanya diambil
/// dari server. ProductDetailCubit disediakan langsung oleh halaman ini.
class DetailProductPage extends StatelessWidget {
  final String slug;

  const DetailProductPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductDetailCubit(HomeRemoteResource())..fetchDetail(slug),
      child: _DetailProductView(slug: slug),
    );
  }
}

class _DetailProductView extends StatelessWidget {
  final String slug;

  const _DetailProductView({required this.slug});

  /// Deskripsi dari server berupa HTML (<p><strong>...). Diubah jadi teks
  /// biasa supaya tidak perlu package tambahan.
  String _htmlToText(String html) {
    var text = html
        .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'</p>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'<li[^>]*>', caseSensitive: false), '• ')
        .replaceAll(RegExp(r'</li>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'<[^>]*>'), '');
    text = text
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'");
    return text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            return _buildContent(context, state.product);
          }
          if (state is ProductDetailError) {
            return _buildError(context, state.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton:
          BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is! ProductDetailLoaded) return const SizedBox.shrink();
          return FloatingActionButton.extended(
            onPressed: () => context
                .read<CartBloc>()
                .add(AddCart(productId: state.product.id, qty: 1)),
            backgroundColor: Colors.orange,
            icon: const Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.white,
            ),
            label: const Text(
              'Add Cart',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Gagal memuat detail produk'),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () =>
                        context.read<ProductDetailCubit>().fetchDetail(slug),
                    child: const Text('Coba lagi'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: BackButton(onPressed: () => Navigator.pop(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProductModel product) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 100),
      children: [
        _buildImageBanner(context, product.image),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildProductInfo(product),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildDescription(product.description),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildReviewSection(product.ratings),
        ),
      ],
    );
  }

  /// Gambar besar di atas + tombol kembali
  Widget _buildImageBanner(BuildContext context, String image) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image.network(
            '${AppConfig.storageImage}$image',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey.shade300,
              child: Icon(Icons.fastfood,
                  size: 48, color: Colors.grey.shade500),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          child: IconButton.filled(
            style: IconButton.styleFrom(backgroundColor: Colors.orange),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              CurrencyHelper.formatRupiah(product.price.toDouble()),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green.shade700,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 2),
                Text(
                  '${product.ratingsAvgRating.toStringAsFixed(1)} '
                  '(${product.ratings.length} Reviews)',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    final text = _htmlToText(description);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(text.isEmpty ? '-' : text),
      ],
    );
  }

  Widget _buildReviewSection(List<RatingModel> ratings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ratings & Reviews',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ratings.isEmpty
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(child: Text('No reviews available')),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ratings.length,
                itemBuilder: (context, index) =>
                    _buildReviewItem(ratings[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 8),
              ),
      ],
    );
  }

  Widget _buildReviewItem(RatingModel review) {
    final name = review.customer?.name ?? 'Anonim';
    final avatar = review.customer?.image;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.orange.shade200,
                backgroundImage: (avatar != null && avatar.isNotEmpty)
                    ? NetworkImage('${AppConfig.storageAvatar}$avatar')
                    : null,
                child: (avatar == null || avatar.isEmpty)
                    ? Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: List.generate(5, (i) {
                  return Icon(
                    i < review.rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 18,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(review.review),
        ],
      ),
    );
  }
}