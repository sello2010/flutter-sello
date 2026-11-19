import 'category_model.dart';
import 'product_model.dart';

/// Satu kategori beserta produk-produknya.
/// Response dari GET /api/public/categories/{slug} (bagian "data").
/// Bukan freezed, jadi tidak perlu build_runner.
class CategoryProductsModel {
  final CategoryModel category;
  final List<ProductModel> products;

  const CategoryProductsModel({
    required this.category,
    required this.products,
  });

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsModel(
      // CategoryModel mengabaikan key "products"
      category: CategoryModel.fromJson(json),
      products: (json['products'] as List? ?? const [])
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}