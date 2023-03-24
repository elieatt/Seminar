import 'package:bloc/bloc.dart';
import 'package:seminar/data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());

  Future<void> startUpAuth() async {
    emit(AuthProgress());
    bool isFirstLauch = await AuthRepository.isFirstLaunch();
    if (isFirstLauch) {
      emit(AuthFirstLaunch());
      return;
    }
    emit(AuthNoToken());
  }
}

class AuthState {}

class AuthInit extends AuthState {}

class AuthProgress extends AuthState {}

class AuthFirstLaunch extends AuthState {}

class AuthNoToken extends AuthState {}

class AuthLoginedIn extends AuthState {}
