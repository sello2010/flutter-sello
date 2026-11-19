import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/checkout/checkout_cubit.dart';
import '../../bloc/location/location_cubit.dart';
import '../../bloc/shipping_cost/shipping_cost_cubit.dart';
import '../../core/utils/currency_helper.dart';
import '../../resource/model/checkout_model.dart';
import '../../resource/model/location_model.dart';
import '../../resource/model/shipping_cost_model.dart';
import '../../resource/remote/checkout_remote_resource.dart';

/// Halaman checkout. Ketiga cubit disediakan di sini (bukan di main.dart),
/// jadi halaman ini cukup dibuka lewat Navigator.push.
class CheckoutPage extends StatefulWidget {
  /// Total harga barang (belum termasuk ongkir).
  final int totalPrice;

  /// Total berat dalam gram.
  final int totalWeight;

  const CheckoutPage({
    super.key,
    required this.totalPrice,
    required this.totalWeight,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CheckoutRemoteResource _remote = CheckoutRemoteResource();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationCubit(_remote)),
        BlocProvider(create: (_) => ShippingCostCubit(_remote)),
        BlocProvider(create: (_) => CheckoutCubit(_remote)),
      ],
      child: _CheckoutView(
        totalPrice: widget.totalPrice,
        totalWeight: widget.totalWeight,
      ),
    );
  }
}

/// Isi halaman. Dipisah supaya context-nya berada di bawah MultiBlocProvider.
class _CheckoutView extends StatefulWidget {
  final int totalPrice;
  final int totalWeight;

  const _CheckoutView({
    required this.totalPrice,
    required this.totalWeight,
  });

  @override
  State<_CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<_CheckoutView> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _addressController = TextEditingController();

  /// Kurir yang tersedia. Dikirim ke server dalam huruf kecil.
  static const List<String> _couriers = [
    'POS',
    'JNE',
    'TIKI',
    'SiCepat',
    'JNT',
    'Ninja',
    'Lion',
    'Anteraja',
    'NCS',
    'Rex',
    'Sentral',
    'Star',
    'Wahana',
  ];

  /// Lokasi yang dipilih dari hasil pencarian.
  LocationModel? _selectedLocation;

  /// Kurir yang dipilih di dropdown.
  String? _selectedCourier;

  /// Layanan/ongkir yang dipilih dari daftar hasil.
  ShippingCostModel? _selectedShipping;

  int get _shippingCost => _selectedShipping?.cost ?? 0;
  int get _grandTotal => widget.totalPrice + _shippingCost;

  /// Tombol "Confirm and Pay" aktif hanya kalau semua data sudah lengkap.
  bool get _isFormValid =>
      _selectedLocation != null &&
      _selectedCourier != null &&
      _selectedShipping != null &&
      _addressController.text.trim().isNotEmpty;

  @override
  void dispose() {
    _locationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _searchLocation() {
    final keyword = _locationController.text.trim();
    if (keyword.isEmpty) {
      _showError('Isi kata kunci lokasi dulu');
      return;
    }
    FocusScope.of(context).unfocus();
    context.read<LocationCubit>().getLocation(keyword);
  }

  /// Kosongkan pilihan kurir dan ongkir (mis. saat lokasi diganti).
  void _resetShipping() {
    setState(() {
      _selectedCourier = null;
      _selectedShipping = null;
    });
    context.read<ShippingCostCubit>().resetShippingCost();
  }

  void _onCourierChanged(String? value) {
    if (value == null) return;
    final location = _selectedLocation;
    if (location == null) {
      _showError('Pilih lokasi dulu');
      return;
    }
    setState(() {
      _selectedCourier = value;
      _selectedShipping = null;
    });
    context.read<ShippingCostCubit>().getShippingCost(
          location.id,
          widget.totalWeight,
          value.toLowerCase(),
        );
  }

  // ---------------------------------------------------------------------------
  // Checkout & pembayaran
  // ---------------------------------------------------------------------------

  void _submit() {
    if (!_formKey.currentState!.validate() || !_isFormValid) return;

    final location = _selectedLocation!;
    final shipping = _selectedShipping!;

    final checkout = CheckoutModel(
      provinceName: location.provinceName,
      cityName: location.cityName,
      districtName: location.districtName,
      subdistrictName: location.subdistrictName,
      zipCode: location.zipCode,
      fullAddress: _addressController.text.trim(),
      weight: widget.totalWeight,
      shippingCourier: _selectedCourier!.toLowerCase(),
      shippingService: shipping.service,
      shippingCost: shipping.cost,
      total: _grandTotal,
    );

    context.read<CheckoutCubit>().checkOut(checkout);
  }

  /// Buka halaman Midtrans, lalu tutup halaman checkout.
  Future<void> _openPayment(String snapToken) async {
    // Messenger diambil sebelum await karena halaman ini akan ditutup.
    final messenger = ScaffoldMessenger.of(context);
    await context.push<String>('/midtransPayment/$snapToken');
    if (!mounted) return;

    messenger.showSnackBar(
      const SnackBar(
        content: Text(
          'Pesanan dibuat. Buka My Orders untuk melihat status pembayaran.',
        ),
      ),
    );

    Navigator.of(context).pop();
  }

  void _checkoutListener(BuildContext context, CheckoutState state) {
    if (state is CheckoutSuccess) {
      _openPayment(state.snapToken);
    } else if (state is CheckoutError) {
      _showError(state.message);
    }
  }

  Widget _buildPayButton() {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: _checkoutListener,
      builder: (context, state) {
        final isLoading = state is CheckoutLoading;
        final enabled = _isFormValid && !isLoading;
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: enabled ? _submit : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Confirm and Pay',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  title: 'Shipping Information',
                  icon: Icons.location_on_outlined,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLocation(),
                      const SizedBox(height: 16),
                      _buildAddressField(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Select Shipping Method',
                  icon: Icons.local_shipping_outlined,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCourierDropdown(),
                      const SizedBox(height: 8),
                      _buildShippingCost(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPriceRow(
                title: 'Total Items:',
                price: widget.totalPrice,
                fontSize: 16,
              ),
              const SizedBox(height: 8),
              _buildPriceRow(
                title: 'Shipping Cost:',
                price: _shippingCost,
                fontSize: 16,
              ),
              Divider(thickness: 2, color: Colors.grey.shade300),
              _buildPriceRow(
                title: 'Grand Total:',
                price: _grandTotal,
                fontSize: 18,
                isBold: true,
              ),
              const SizedBox(height: 12),
              _buildPayButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _locationController,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (_) => _searchLocation(),
                // Kalau teks diubah manual, pilihan sebelumnya tidak berlaku
                onChanged: (_) {
                  setState(() => _selectedLocation = null);
                  if (_selectedCourier != null) _resetShipping();
                },
                decoration: InputDecoration(
                  labelText: 'Search Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Search Location cannot be empty'
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: _searchLocation,
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return switch (state) {
              LocationLoading() => const Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(child: CircularProgressIndicator()),
                ),
              LocationLoaded(:final locations) =>
                _buildLocationList(locations),
              LocationError(:final message) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ],
    );
  }

  Widget _buildLocationList(List<LocationModel> locations) {
    if (locations.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8),
        child: Text('Lokasi tidak ditemukan'),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return ListTile(
            title: Text(location.label),
            onTap: () {
              setState(() {
                _locationController.text = location.label;
                _selectedLocation = location;
              });
              _resetShipping();
              context.read<LocationCubit>().clearLocation();
            },
          );
        },
      ),
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: _addressController,
      maxLines: 3,
      // Rebuild supaya status tombol "Confirm and Pay" ikut berubah
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please enter your address' : null,
    );
  }

  Widget _buildCourierDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      value: _selectedCourier,
      items: _couriers
          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
          .toList(),
      hint: const Text('Select Shipping Method'),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please select shipping method' : null,
      onChanged: _onCourierChanged,
    );
  }

  Widget _buildShippingCost() {
    return BlocBuilder<ShippingCostCubit, ShippingCostState>(
      builder: (context, state) {
        return switch (state) {
          ShippingCostLoading() => const Padding(
              padding: EdgeInsets.all(12),
              child: Center(child: CircularProgressIndicator()),
            ),
          ShippingCostLoaded(:final shippingCost) =>
            _buildShippingOptions(shippingCost),
          ShippingCostError(:final message) => Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildShippingOptions(List<ShippingCostModel> options) {
    if (options.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8),
        child: Text('Tidak ada data tersedia'),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final selected = _selectedShipping == option;
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? Theme.of(context).colorScheme.primary : null,
          ),
          title: Text(
            '${option.service} - ${CurrencyHelper.formatRupiah(option.cost.toDouble())}',
          ),
          subtitle: Text('${option.description} • Estimasi: ${option.etd}'),
          onTap: () => setState(() => _selectedShipping = option),
        );
      },
    );
  }

  Widget _buildPriceRow({
    required String title,
    required int price,
    required double fontSize,
    bool isBold = false,
  }) {
    final weight = isBold ? FontWeight.bold : FontWeight.normal;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: fontSize, fontWeight: weight)),
        Text(
          CurrencyHelper.formatRupiah(price.toDouble()),
          style: TextStyle(fontSize: fontSize, fontWeight: weight),
        ),
      ],
    );
  }
}