import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/cart_response_model.dart';
import '../../resource/remote/cart_remote_resource.dart';

// -----------------------------------------------------------------------------
// Event
// -----------------------------------------------------------------------------

sealed class CartEvent {
  const CartEvent();
}

/// Ambil isi keranjang dari server.
class FetchCart extends CartEvent {
  const FetchCart();
}

/// Simpan produk ke keranjang.
class AddCart extends CartEvent {
  final int productId;
  final int qty;
  const AddCart({required this.productId, required this.qty});
}

/// Hapus satu item dari keranjang.
class RemoveCart extends CartEvent {
  final int cartId;
  const RemoveCart({required this.cartId});
}

/// Tambah jumlah (+1).
class IncrementCart extends CartEvent {
  final int productId;
  final int cartId;
  const IncrementCart({required this.productId, required this.cartId});
}

/// Kurangi jumlah (-1). Tidak dijalankan kalau jumlahnya sudah 1.
class DecrementCart extends CartEvent {
  final int productId;
  final int cartId;
  const DecrementCart({required this.productId, required this.cartId});
}

// -----------------------------------------------------------------------------
// State
// -----------------------------------------------------------------------------

sealed class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final CartResponseModel cartResponse;
  const CartLoaded(this.cartResponse);
}

/// Produk berhasil disimpan ke keranjang (message dari server).
class CartStored extends CartState {
  final String message;
  const CartStored(this.message);
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);
}

// -----------------------------------------------------------------------------
// Bloc
// -----------------------------------------------------------------------------

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRemoteResource _remote;

  CartBloc(this._remote) : super(const CartInitial()) {
    on<FetchCart>(_onFetch);
    on<AddCart>(_onAdd);
    on<RemoveCart>(_onRemove);
    on<IncrementCart>(_onIncrement);
    on<DecrementCart>(_onDecrement);
  }

  /// Ambil keranjang lalu keluarkan Loaded atau Error.
  Future<void> _refresh(Emitter<CartState> emit) async {
    final result = await _remote.fetchCart();
    result.fold(
      (error) => emit(CartError(error)),
      (cartResponse) => emit(CartLoaded(cartResponse)),
    );
  }

  Future<void> _onFetch(FetchCart event, Emitter<CartState> emit) async {
    emit(const CartLoading());
    await _refresh(emit);
  }

  Future<void> _onAdd(AddCart event, Emitter<CartState> emit) async {
    final result = await _remote.cartStore(event.productId, event.qty);
    final stored = result.fold<String?>(
      (error) {
        emit(CartError(error));
        return null;
      },
      (message) {
        emit(CartStored(message));
        return message;
      },
    );
    // Setelah berhasil, muat ulang supaya halaman keranjang ikut terbaru
    if (stored != null) await _refresh(emit);
  }

  Future<void> _onRemove(RemoveCart event, Emitter<CartState> emit) async {
    final result = await _remote.deleteCart(event.cartId);
    result.fold((error) => emit(CartError(error)), (_) {});
    await _refresh(emit);
  }

  Future<void> _onIncrement(
    IncrementCart event,
    Emitter<CartState> emit,
  ) async {
    final result = await _remote.incrementCart(event.productId, event.cartId);
    result.fold((error) => emit(CartError(error)), (_) {});
    await _refresh(emit);
  }

  Future<void> _onDecrement(
    DecrementCart event,
    Emitter<CartState> emit,
  ) async {
    // Server tidak membatasi jumlah minimal, jadi dijaga di sini:
    // kalau jumlahnya sudah 1, jangan dikurangi lagi.
    final current = state;
    if (current is CartLoaded) {
      for (final item in current.cartResponse.carts) {
        if (item.id == event.cartId && item.qty <= 1) return;
      }
    }

    final result = await _remote.decrementCart(event.productId, event.cartId);
    result.fold((error) => emit(CartError(error)), (_) {});
    await _refresh(emit);
  }
}