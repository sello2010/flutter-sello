import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/slider_model.dart';
import '../../resource/remote/home_remote_resource.dart';

sealed class SliderState {
  const SliderState();
}

class SliderInitial extends SliderState {
  const SliderInitial();
}

class SliderLoading extends SliderState {
  const SliderLoading();
}

class SliderLoaded extends SliderState {
  final List<SliderModel> sliders;
  const SliderLoaded(this.sliders);
}

class SliderError extends SliderState {
  final String message;
  const SliderError(this.message);
}

class SliderCubit extends Cubit<SliderState> {
  final HomeRemoteResource _remote;

  SliderCubit(this._remote) : super(const SliderInitial());

  Future<void> fetchSlider() async {
    emit(const SliderLoading());

    final result = await _remote.fetchSliders();
    if (isClosed) return;

    result.fold(
      (error) => emit(SliderError(error)),
      (sliders) => emit(SliderLoaded(sliders)),
    );
  }
}