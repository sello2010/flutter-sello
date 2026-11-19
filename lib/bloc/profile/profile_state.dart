import 'package:freezed_annotation/freezed_annotation.dart';
import '../../resource/model/customer_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded(CustomerModel customer) = ProfileLoaded;
  const factory ProfileState.updateSuccess(String message) = ProfileUpdateSuccess;
  const factory ProfileState.error(String message) = ProfileError;
}