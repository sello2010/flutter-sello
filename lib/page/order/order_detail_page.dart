import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/order_detail/order_detail_cubit.dart';
import '../../bloc/review_product/review_product_cubit.dart';
import '../../core/constants/app_config.dart';
import '../../resource/model/order_detail_model.dart';
import '../../resource/model/order_model.dart';
import '../../resource/remote/checkout_remote_resource.dart';
import '../../resource/remote/order_remote_resource.dart';

/// Pembungkus: menyediakan cubit untuk detail order dan review produk,
/// jadi tidak perlu mengubah router.
class OrderDetailPage extends StatelessWidget {
  final OrderModel order;

  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              OrderDetailCubit(OrderRemoteResource())..fetch(order.snapToken),
        ),
        BlocProvider(
          create: (_) => ReviewProductCubit(OrderRemoteResource()),
        ),
      ],
      child: _OrderDetailView(order: order),
    );
  }
}

class _OrderDetailView extends StatefulWidget {
  final OrderModel order;

  const _OrderDetailView({required this.order});

  @override
  State<_OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<_OrderDetailView> {
  // Satuan berat yang ditampilkan.
  static const String _weightUnit = 'g';

  late String _status;

  /// Produk yang baru saja berhasil diulas di halaman ini.
  final Set<int> _reviewedProductIds = {};

  OrderModel get order => widget.order;

  @override
  void initState() {
    super.initState();
    _status = order.status;
    _refreshStatus();
  }

  /// Tanya server status terbaru, lalu perbarui tampilan.
  Future<void> _refreshStatus() async {
    if (_isSuccess || order.snapToken == null) return;
    final result = await CheckoutRemoteResource().checkStatus(order.invoice);
    if (!mounted) return;
    result.fold(
      (_) {}, // gagal: biarkan status lama
      (status) => setState(() => _status = status.toLowerCase()),
    );
  }

  bool get _isSuccess {
    final status = _status.toLowerCase();
    return status == 'success' || status == 'paid';
  }

  bool get _isPayable => order.snapToken != null && !_isSuccess;

  // ---------------------------------------------------------------------------
  // Helper format
  // ---------------------------------------------------------------------------

  String _formatRupiah(String value) {
    final number = double.tryParse(value) ?? 0;
    final str = number.toInt().toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      final posFromRight = str.length - i;
      buffer.write(str[i]);
      if (posFromRight > 1 && posFromRight % 3 == 1) {
        buffer.write('.');
      }
    }
    return 'Rp $buffer';
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
        'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
      ];
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    } catch (_) {
      return isoDate;
    }
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'paid':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'expired':
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  /// Di response server hanya ada nama file gambar.
  /// Sesuaikan folder "/storage/products/" kalau gambar di proyek Anda
  /// disimpan di tempat lain (cek cara halaman cart/produk menampilkannya).
  String _imageUrl(String file) {
    if (file.startsWith('http')) return file;
    final root = AppConfig.apiPath.replaceFirst(RegExp(r'/api/?$'), '');
    if (file.contains('/')) return '$root/storage/$file';
       return '$root/storage/$file';
  }

  // ---------------------------------------------------------------------------
  // Widget kecil
  // ---------------------------------------------------------------------------

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          const Divider(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _row(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Pembayaran
  // ---------------------------------------------------------------------------

  bool _isSuccessResult(String result) {
    return result == 'Payment Success' || result == 'success';
  }

  void _handlePaymentResult(String? result) {
    if (result == null) return;

    String message;
    switch (result) {
      case 'Payment Success':
      case 'success':
        message = 'Pembayaran berhasil!';
        break;
      case 'Payment Expired':
        message = 'Pembayaran sudah kedaluwarsa.';
        break;
      case 'Payment Canceled':
        message = 'Pembayaran dibatalkan.';
        break;
      case 'Payment Denied':
        message = 'Pembayaran ditolak.';
        break;
      case 'failure':
        message = 'Pembayaran gagal.';
        break;
      default:
        message = result;
    }

    // Update tampilan langsung supaya tombol Payment hilang
    // dan tombol ulasan muncul.
    if (_isSuccessResult(result)) {
      setState(() => _status = 'success');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _onPaymentPressed() async {
    final result = await context.push<String>(
      '/midtransPayment/${order.snapToken}',
    );
    if (!mounted) return;
    _handlePaymentResult(result);
    await _refreshStatus();
  }

  // ---------------------------------------------------------------------------
  // Review produk
  // ---------------------------------------------------------------------------

  void _reviewProductListener(BuildContext context, ReviewProductState state) {
    if (state is ReviewProductSuccess) {
      setState(() => _reviewedProductIds.add(state.productId));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terima kasih telah memberikan ulasan'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (state is ReviewProductError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _openReviewDialog(OrderItemModel item) {
    // Cubit diambil di sini karena dialog berada di luar subtree provider.
    final cubit = context.read<ReviewProductCubit>();
    showDialog(
      context: context,
      builder: (_) => _ReviewDialog(item: item, cubit: cubit),
    );
  }

  // ---------------------------------------------------------------------------
  // Bagian-bagian halaman
  // ---------------------------------------------------------------------------

  Widget _buildShippingSection(OrderDetailState state) {
    return _sectionCard(
      title: 'Shipping Details',
      icon: Icons.local_shipping_outlined,
      child: Column(
        children: [
          if (state is OrderDetailLoaded && state.detail.shipping != null) ...[
            _row('Courier',
                state.detail.shipping!.shippingCourier.toUpperCase()),
            _row('Cost', _formatRupiah(state.detail.shipping!.shippingCost)),
            _row('Service', state.detail.shipping!.shippingService),
          ],
          _row('Weight', '${order.weight} $_weightUnit'),
        ],
      ),
    );
  }

  Widget _buildItemCard(OrderItemModel item) {
    final product = item.product;
    final reviewed = _reviewedProductIds.contains(item.productId);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: product == null
                ? _imagePlaceholder()
                : Image.network(
                    _imageUrl(product.image),
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _imagePlaceholder(),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.title ?? 'Produk #${item.productId}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'Quantity: ${item.qty}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatRupiah(item.price.toString()),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
          ),
          // Tombol ulasan hanya muncul kalau order sudah sukses
          if (_isSuccess)
            IconButton(
              tooltip: reviewed ? 'Sudah diulas' : 'Beri ulasan',
              onPressed: reviewed ? null : () => _openReviewDialog(item),
              style: IconButton.styleFrom(
                backgroundColor:
                    reviewed ? Colors.grey.shade300 : Colors.orange,
              ),
              icon: Icon(
                reviewed ? Icons.check : Icons.rate_review,
                color: Colors.white,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 64,
      height: 64,
      color: Colors.grey.shade300,
      child: Icon(Icons.fastfood, color: Colors.grey.shade500),
    );
  }

  Widget _buildItemsSection(OrderDetailState state) {
    // Order tanpa snap_token / belum dimuat: bagian ini disembunyikan
    if (state is OrderDetailInitial || state is OrderDetailUnavailable) {
      return const SizedBox.shrink();
    }

    Widget content;
    if (state is OrderDetailLoading) {
      content = const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: CircularProgressIndicator(color: Colors.orange),
        ),
      );
    } else if (state is OrderDetailError) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(state.message,
              style: const TextStyle(color: Colors.red, fontSize: 12)),
          TextButton(
            onPressed: () =>
                context.read<OrderDetailCubit>().fetch(order.snapToken),
            child: const Text('Coba lagi'),
          ),
        ],
      );
    } else if (state is OrderDetailLoaded) {
      final items = state.detail.transactionDetails;
      content = items.isEmpty
          ? const Text('Tidak ada item pesanan.',
              style: TextStyle(fontSize: 13))
          : Column(children: items.map(_buildItemCard).toList());
    } else {
      content = const SizedBox.shrink();
    }

    return _sectionCard(
      title: 'Ordered Items',
      icon: Icons.shopping_bag_outlined,
      child: content,
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewProductCubit, ReviewProductState>(
      listener: _reviewProductListener,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF3E0),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Order Detail',
              style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionCard(
                title: 'Order Details',
                icon: Icons.receipt_long,
                child: Column(
                  children: [
                    _row('Invoice Number', order.invoice),
                    _row('Order Date', _formatDate(order.createdAt)),
                    _row(
                      'Status',
                      _status[0].toUpperCase() + _status.substring(1),
                      valueColor: _statusColor(_status),
                    ),
                    _row('Grand Total', _formatRupiah(order.total)),
                  ],
                ),
              ),
              _sectionCard(
                title: 'Delivery Details',
                icon: Icons.location_on_outlined,
                child: Text(
                  '${order.fullAddress}, ${order.subdistrictName}, ${order.districtName}, ${order.cityName}, ${order.provinceName} ${order.zipCode}',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              BlocBuilder<OrderDetailCubit, OrderDetailState>(
                builder: (context, state) => _buildShippingSection(state),
              ),
              BlocBuilder<OrderDetailCubit, OrderDetailState>(
                builder: (context, state) => _buildItemsSection(state),
              ),
              if (_isPayable)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onPaymentPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dialog "Beri Ulasan": rating bintang 1-5 + teks ulasan.
class _ReviewDialog extends StatefulWidget {
  final OrderItemModel item;
  final ReviewProductCubit cubit;

  const _ReviewDialog({required this.item, required this.cubit});

  @override
  State<_ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<_ReviewDialog> {
  final _formKey = GlobalKey<FormState>();
  final _reviewController = TextEditingController();
  int _rating = 0;
  bool _ratingMissing = false;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submit() {
    final valid = _formKey.currentState!.validate();
    if (_rating == 0) {
      setState(() => _ratingMissing = true);
      return;
    }
    if (!valid) return;

    widget.cubit.reviewProduct(
      transactionDetailId: widget.item.id,
      productId: widget.item.productId,
      rating: _rating,
      review: _reviewController.text.trim(),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Beri Ulasan'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Beri rating untuk produk ini:'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final star = index + 1;
                  return GestureDetector(
                    onTap: () => setState(() {
                      _rating = star;
                      _ratingMissing = false;
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Icon(
                        star <= _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 36,
                      ),
                    ),
                  );
                }),
              ),
              if (_ratingMissing)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    'Pilih rating terlebih dahulu',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _reviewController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Tulis ulasan Anda...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Ulasan tidak boleh kosong'
                    : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal', style: TextStyle(color: Colors.orange)),
        ),
        FilledButton(
          onPressed: _submit,
          style: FilledButton.styleFrom(backgroundColor: Colors.orange),
          child: const Text('Kirim', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}