/// Data form checkout yang dikirim ke POST /public/checkout.
class CheckoutModel {
  final String provinceName;
  final String cityName;
  final String districtName;
  final String subdistrictName;
  final String zipCode;
  final String fullAddress;
  final int weight;
  final String shippingCourier;
  final String shippingService;
  final int shippingCost;
  final int total;

  const CheckoutModel({
    required this.provinceName,
    required this.cityName,
    required this.districtName,
    required this.subdistrictName,
    required this.zipCode,
    required this.fullAddress,
    required this.weight,
    required this.shippingCourier,
    required this.shippingService,
    required this.shippingCost,
    required this.total,
  });

  /// Body request sesuai nama field di CheckoutController Laravel.
  Map<String, dynamic> toRequestBody() => {
        'province_name': provinceName,
        'city_name': cityName,
        'district_name': districtName,
        'subdistrict_name': subdistrictName,
        'zip_code': zipCode,
        'full_address': fullAddress,
        'weight': weight,
        'shipping_courier': shippingCourier,
        'shipping_service': shippingService,
        'shipping_cost': shippingCost,
        'total': total,
      };
}