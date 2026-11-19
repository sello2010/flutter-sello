class LocationModel {
  final int id;
  final String label;
  final String provinceName;
  final String cityName;
  final String districtName;
  final String subdistrictName;
  final String zipCode;

  const LocationModel({
    required this.id,
    required this.label,
    required this.provinceName,
    required this.cityName,
    required this.districtName,
    required this.subdistrictName,
    required this.zipCode,
  });

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        id: json['id'] as int,
        label: (json['label'] ?? '').toString(),
        provinceName: (json['province_name'] ?? '').toString(),
        cityName: (json['city_name'] ?? '').toString(),
        districtName: (json['district_name'] ?? '').toString(),
        subdistrictName: (json['subdistrict_name'] ?? '').toString(),
        zipCode: (json['zip_code'] ?? '').toString(),
      );
}