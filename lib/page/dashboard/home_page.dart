import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/category/category_cubit.dart';
import '../../bloc/product/product_cubit.dart';
import '../../bloc/product_popular/product_popular_cubit.dart';
import '../../bloc/slider/slider_cubit.dart';
import '../../core/components/category_card.dart';
import '../../core/components/product_card.dart';
import '../../core/constants/app_config.dart';
import '../../resource/model/slider_model.dart';
import '../../resource/remote/home_remote_resource.dart';
import '../product/all_product_page.dart';
import '../product/search_product_page.dart';

/// Pembungkus: menyediakan semua cubit untuk halaman Home dan langsung
/// memuat datanya, jadi tidak perlu mengubah main.dart.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final remote = HomeRemoteResource();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SliderCubit(remote)..fetchSlider()),
        BlocProvider(create: (_) => CategoryCubit(remote)..fetchCategory()),
        BlocProvider(
          create: (_) => ProductPopularCubit(remote)..fetchProductPopular(),
        ),
        BlocProvider(create: (_) => ProductCubit(remote)..fetchProduct()),
      ],
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();

  void _search() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SearchProductPage(query: query)),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToAllProducts() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AllProductPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _search(),
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.orange),
                  onPressed: _search,
                ),
              ),
            ),
          ),
          _buildSliderSection(),
          const SizedBox(height: 16),
          _buildCategorySection(),
          _buildProductSection(
            title: 'Product Populer',
            icon: Icons.local_fire_department_outlined,
            child: _buildPopularList(),
          ),
          _buildProductSection(
            title: 'Product Terbaru',
            icon: Icons.shopping_bag_outlined,
            child: _buildNewList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Bagian Produk (Populer & Terbaru)
  // ---------------------------------------------------------------------------

  Widget _buildProductSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: _navigateToAllProducts,
                  child: Text(
                    'Lihat Lainnya',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }

  /// Produk populer: daftar menyamping
  Widget _buildPopularList() {
    return BlocBuilder<ProductPopularCubit, ProductPopularState>(
      builder: (context, state) {
        if (state is ProductPopularLoaded) {
          if (state.products.isEmpty) return _buildEmptyMessage();
          return SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.products[index],
                  isPopular: true,
                );
              },
            ),
          );
        }
        if (state is ProductPopularError) {
          return _buildErrorMessage(
            'Gagal memuat produk populer',
            state.message,
            () => context.read<ProductPopularCubit>().fetchProductPopular(),
          );
        }
        return _buildLoadingIndicator();
      },
    );
  }

  /// Produk terbaru: daftar ke bawah (halaman pertama saja)
  Widget _buildNewList() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          if (state.products.isEmpty) return _buildEmptyMessage();
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: state.products[index],
                isPopular: false,
              );
            },
          );
        }
        if (state is ProductError) {
          return _buildErrorMessage(
            'Gagal memuat produk terbaru',
            state.message,
            () => context.read<ProductCubit>().fetchProduct(isRefresh: true),
          );
        }
        return _buildLoadingIndicator();
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Bagian Kategori
  // ---------------------------------------------------------------------------

  Widget _buildCategorySection() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          if (state.categories.isEmpty) return _buildEmptyMessage();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(category: state.categories[index]);
                },
              ),
            ),
          );
        }
        if (state is CategoryError) {
          return _buildErrorMessage(
            'Gagal memuat kategori',
            state.message,
            () => context.read<CategoryCubit>().fetchCategory(),
          );
        }
        return _buildLoadingIndicator();
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Bagian Slider
  // ---------------------------------------------------------------------------

  Widget _buildSliderSection() {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderLoaded) {
          return _buildImageSlider(state.sliders);
        }
        if (state is SliderError) {
          return _buildErrorMessage(
            'Gagal memuat slider',
            state.message,
            () => context.read<SliderCubit>().fetchSlider(),
          );
        }
        // Initial dan Loading
        return _buildLoadingIndicator();
      },
    );
  }

  Widget _buildImageSlider(List<SliderModel> sliders) {
    if (sliders.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              itemCount: sliders.length,
              itemBuilder: (context, index) {
                final slider = sliders[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    '${AppConfig.storageImage}${slider.image}',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade300,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey.shade500,
                        size: 40,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildSliderNavigationButton(Icons.arrow_back_ios, () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          _buildSliderNavigationButton(Icons.arrow_forward_ios, () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }, alignRight: true),
        ],
      ),
    );
  }

  /// Tombol panah kiri/kanan di atas slider (dipusatkan secara vertikal).
  Widget _buildSliderNavigationButton(
    IconData icon,
    VoidCallback onPressed, {
    bool alignRight = false,
  }) {
    return Positioned(
      left: alignRight ? null : 8,
      right: alignRight ? 8 : null,
      top: 0,
      bottom: 0,
      child: Center(
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Widget bantu
  // ---------------------------------------------------------------------------

  Widget _buildErrorMessage(
    String title,
    String message,
    VoidCallback onRetry,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          TextButton(
            onPressed: onRetry,
            child: const Text('Coba lagi'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyMessage() =>
      const Center(child: Text('Tidak ada data tersedia'));

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}