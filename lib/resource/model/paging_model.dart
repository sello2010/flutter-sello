/// Pembungkus data berhalaman dari Laravel (paginate).
/// Bukan freezed, jadi tidak perlu build_runner.
class PagingModel<T> {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final List<T> data;

  const PagingModel({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.data,
  });

  bool get hasNextPage => currentPage < lastPage;

  factory PagingModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final items = (json['data'] as List? ?? const [])
        .map((e) => fromJsonT(e as Map<String, dynamic>))
        .toList();

    return PagingModel<T>(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? items.length,
      total: (json['total'] as num?)?.toInt() ?? items.length,
      data: items,
    );
  }
}