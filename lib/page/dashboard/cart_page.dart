import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../core/components/cart_card.dart';
import '../../core/utils/currency_helper.dart';
import '../../resource/model/cart_response_model.dart';
import '../checkout/checkout_page.dart';

/// Halaman keranjang. CartBloc dipasang global di main.dart.
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  /// Isi keranjang terakhir yang berhasil dimuat. Disimpan di sini supaya
  /// daftar tidak hilang sesaat ketika ada pesan error/sukses dari BLoC.
  CartResponseModel? _cart;

  @override
  void initState() {
    super.initState();
    // Selalu muat ulang saat halaman dibuka
    context.read<CartBloc>().add(const FetchCart());
  }

  int get _totalPrice => _cart?.totalPrice ?? 0;
  int get _totalWeight => _cart?.totalWeight ?? 0;

  void _onCartState(BuildContext context, CartState state) {
    // Pesan error/sukses ditampilkan secara global di main.dart
    if (state is CartLoaded) {
      setState(() => _cart = state.cartResponse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: _buildCartList()),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return BlocConsumer<CartBloc, CartState>(
      listener: _onCartState,
      builder: (context, state) {
        final cart = _cart;

        if (cart != null) {
          if (cart.carts.isEmpty) return _buildEmptyCart();
          return ListView.builder(
            itemCount: cart.carts.length,
            itemBuilder: (context, index) => CartCard(cart: cart.carts[index]),
          );
        }

        // Belum ada data yang berhasil dimuat
        if (state is CartError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Gagal memuat keranjang'),
                  const SizedBox(height: 4),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () =>
                        context.read<CartBloc>().add(const FetchCart()),
                    child: const Text('Coba lagi'),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildBottomBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                CurrencyHelper.formatRupiah(_totalPrice.toDouble()),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: (_totalPrice > 0 && _totalWeight > 0)
                  ? _navigateToCheckout
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCheckout() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CheckoutPage(
          totalPrice: _totalPrice,
          totalWeight: _totalWeight,
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined,
              size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          const Text('Keranjang masih kosong'),
        ],
      ),
    );
  }
}