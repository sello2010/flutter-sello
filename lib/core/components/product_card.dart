import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../constants/app_config.dart';
import '../utils/currency_helper.dart';
import '../../page/product/detail_product_page.dart';
import '../../resource/model/product_model.dart';

/// Kartu produk.
/// [isPopular] true  -> kartu tegak untuk daftar horizontal (produk populer)
/// [isPopular] false -> kartu mendatar untuk daftar vertikal (produk terbaru)
///
/// Kartu ditekan -> membuka halaman detail produk (kecuali [onTap] diisi).
/// Tombol keranjang mengirim AddCart ke CartBloc (kecuali [onAddToCart] diisi).
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isPopular;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.isPopular,
    this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return isPopular ? _buildPopular(context) : _buildNew(context);
  }

  void _openDetail(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailProductPage(slug: product.slug),
      ),
    );
  }

  Widget _image({required double height, double? width}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        '${AppConfig.storageImage}${product.image}',
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: height,
          width: width,
          color: Colors.grey.shade300,
          child: Icon(Icons.fastfood, color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget _price() {
    return Text(
      CurrencyHelper.formatRupiah(product.price.toDouble()),
      style: TextStyle(color: Colors.green.shade700),
    );
  }

  Widget _rating() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 2),
        Text(
          product.ratingsAvgRating.toStringAsFixed(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onAddToCart ??
          () => context
              .read<CartBloc>()
              .add(AddCart(productId: product.id, qty: 1)),
      style: IconButton.styleFrom(backgroundColor: Colors.orange),
      icon: const Icon(
        Icons.add_shopping_cart_rounded,
        color: Colors.white,
      ),
    );
  }

  /// Kartu mendatar (produk terbaru)
  Widget _buildNew(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _openDetail(context),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: _image(height: 100, width: 100),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 56, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        _price(),
                        _rating(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(right: 10, bottom: 10, child: _addToCartButton(context)),
          ],
        ),
      ),
    );
  }

  /// Kartu tegak (produk populer)
  Widget _buildPopular(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _openDetail(context),
        child: SizedBox(
          width: 170,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _image(height: 110, width: double.infinity),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        _price(),
                        _rating(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(right: 2, bottom: 2, child: _addToCartButton(context)),
            ],
          ),
        ),
      ),
    );
  }
}