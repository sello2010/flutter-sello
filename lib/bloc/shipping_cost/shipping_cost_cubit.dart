import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/shipping_cost_model.dart';
import '../../resource/remote/checkout_remote_resource.dart';

sealed class ShippingCostState {
  const ShippingCostState();
}

class ShippingCostInitial extends ShippingCostState {
  const ShippingCostInitial();
}

class ShippingCostLoading extends ShippingCostState {
  const ShippingCostLoading();
}

class ShippingCostLoaded extends ShippingCostState {
  final List<ShippingCostModel> shippingCost;
  const ShippingCostLoaded(this.shippingCost);
}

class ShippingCostError extends ShippingCostState {
  final String message;
  const ShippingCostError(this.message);
}

class ShippingCostCubit extends Cubit<ShippingCostState> {
  final CheckoutRemoteResource _remote;

  ShippingCostCubit(this._remote) : super(const ShippingCostInitial());

  /// [destination] = id lokasi, [weight] dalam gram, [courier] mis. "jne".
  Future<void> getShippingCost(
      int destination, int weight, String courier) async {
    emit(const ShippingCostLoading());
    final result = await _remote.getShippingCost(destination, weight, courier);
    result.fold(
      (error) => emit(ShippingCostError(error)),
      (data) => emit(ShippingCostLoaded(data)),
    );
  }

  /// Kosongkan hasil ongkir, mis. saat alamat atau kurir diganti.
  void resetShippingCost() => emit(const ShippingCostInitial());
}