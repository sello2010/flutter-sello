import 'product_model.dart';

/// Response dari GET /api/public/carts (bagian "data").
/// Bukan freezed, jadi tidak perlu build_runner.
class CartResponseModel {
  final int totalWeight;
  final int totalPrice;
  final List<CartItemModel> carts;

  const CartResponseModel({
    required this.totalWeight,
    required this.totalPrice,
    required this.carts,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      totalWeight: (json['total_weight'] as num?)?.toInt() ?? 0,
      totalPrice: (json['total_price'] as num?)?.toInt() ?? 0,
      carts: (json['carts'] as List? ?? const [])
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Satu item di keranjang.
class CartItemModel {
  final int id;
  final int customerId;
  final int productId;
  final int qty;
  final ProductModel? product;

  const CartItemModel({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.qty,
    this.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final rawProduct = json['product'];
    return CartItemModel(
      id: (json['id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      qty: (json['qty'] as num?)?.toInt() ?? 1,
      product: rawProduct is Map<String, dynamic>
          ? ProductModel.fromJson(rawProduct)
          : null,
    );
  }
}