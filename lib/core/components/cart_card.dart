import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../constants/app_config.dart';
import '../utils/currency_helper.dart';
import '../../resource/model/cart_response_model.dart';

/// Satu item di halaman keranjang: gambar, nama, harga,
/// tombol hapus, dan tombol tambah/kurangi jumlah.
class CartCard extends StatelessWidget {
  final CartItemModel cart;

  const CartCard({super.key, required this.cart});

  void _remove(BuildContext context) {
    context.read<CartBloc>().add(RemoveCart(cartId: cart.id));
  }

  void _increase(BuildContext context) {
    context.read<CartBloc>().add(
          IncrementCart(productId: cart.productId, cartId: cart.id),
        );
  }

  void _decrease(BuildContext context) {
    context.read<CartBloc>().add(
          DecrementCart(productId: cart.productId, cartId: cart.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    final product = cart.product;
    // Jumlah 1 tidak bisa dikurangi lagi (untuk menghapus, pakai ikon sampah)
    final canDecrease = cart.qty > 1;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: product == null
                        ? _placeholder()
                        : Image.network(
                            '${AppConfig.storageImage}${product.image}',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => _placeholder(),
                          ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product?.title ?? 'Produk #${cart.productId}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          CurrencyHelper.formatRupiah(
                            (product?.price ?? 0).toDouble(),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _remove(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orangeAccent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: Icon(
                          Icons.remove,
                          color: canDecrease ? Colors.white : Colors.white54,
                        ),
                        onPressed:
                            canDecrease ? () => _decrease(context) : null,
                      ),
                      Text(
                        '${cart.qty}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () => _increase(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey.shade300,
      child: Icon(Icons.fastfood, color: Colors.grey.shade500),
    );
  }
}