class ShippingCostModel {
  final String name;
  final String code;
  final String service;
  final String description;
  final int cost;
  final String etd;

  const ShippingCostModel({
    required this.name,
    required this.code,
    required this.service,
    required this.description,
    required this.cost,
    required this.etd,
  });

  factory ShippingCostModel.fromMap(Map<String, dynamic> json) =>
      ShippingCostModel(
        name: (json['name'] ?? '').toString(),
        code: (json['code'] ?? '').toString(),
        service: (json['service'] ?? '').toString(),
        description: (json['description'] ?? '').toString(),
        cost: (json['cost'] as num? ?? 0).toInt(),
        etd: (json['etd'] ?? '').toString(),
      );
}