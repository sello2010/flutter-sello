import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/checkout_model.dart';
import '../../resource/remote/checkout_remote_resource.dart';

sealed class CheckoutState {
  const CheckoutState();
}

class CheckoutInitial extends CheckoutState {
  const CheckoutInitial();
}

class CheckoutLoading extends CheckoutState {
  const CheckoutLoading();
}

/// [snapToken] dipakai untuk membuka pembayaran Midtrans.
class CheckoutSuccess extends CheckoutState {
  final String snapToken;
  const CheckoutSuccess(this.snapToken);
}

class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
}

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRemoteResource _remote;

  CheckoutCubit(this._remote) : super(const CheckoutInitial());

  Future<void> checkOut(CheckoutModel checkout) async {
    emit(const CheckoutLoading());
    final result = await _remote.checkOut(checkout);
    result.fold(
      (error) => emit(CheckoutError(error)),
      (snapToken) => emit(CheckoutSuccess(snapToken)),
    );
  }
}