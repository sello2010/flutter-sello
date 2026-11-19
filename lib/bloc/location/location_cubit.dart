import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/location_model.dart';
import '../../resource/remote/checkout_remote_resource.dart';

sealed class LocationState {
  const LocationState();
}

class LocationInitial extends LocationState {
  const LocationInitial();
}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationLoaded extends LocationState {
  final List<LocationModel> locations;
  const LocationLoaded(this.locations);
}

class LocationError extends LocationState {
  final String message;
  const LocationError(this.message);
}

class LocationCubit extends Cubit<LocationState> {
  final CheckoutRemoteResource _remote;

  LocationCubit(this._remote) : super(const LocationInitial());

  Future<void> getLocation(String search) async {
    emit(const LocationLoading());
    final result = await _remote.getLocation(search);
    result.fold(
      (error) => emit(LocationError(error)),
      (data) => emit(LocationLoaded(data)),
    );
  }

  /// Kosongkan hasil pencarian.
  void clearLocation() => emit(const LocationInitial());
}