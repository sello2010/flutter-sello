import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/remote/profile_remote_resource.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRemoteResource profileRemoteResource;

  ProfileBloc(this.profileRemoteResource) : super(const ProfileState.initial()) {
    on<FetchProfile>(_onFetchProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onFetchProfile(
    FetchProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await profileRemoteResource.fetchProfile();

    result.fold(
      (error) => emit(ProfileState.error(error)),
      (customer) => emit(ProfileState.loaded(customer)),
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await profileRemoteResource.updateProfile(
      name: event.name,
      email: event.email,
    );

    result.fold(
      (error) => emit(ProfileState.error(error.toString())),
      (message) => emit(ProfileState.updateSuccess(message)),
    );
  }
}