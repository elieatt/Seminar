import 'package:bloc/bloc.dart';
import 'package:seminar/data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit()) {
    startUpAuth();
  }

  Future<void> startUpAuth() async {
    emit(AuthProgress());
    bool isFirstLauch = await AuthRepository.isFirstLaunch();
    if (isFirstLauch) {
      emit(AuthFirstLaunch());
      return;
    }
    emit(AuthNoToken());
  }

  Future<void> tutroialPassed() async {
    await AuthRepository.tutorialPassed();
    emit(AuthNoToken());
  }

  @override
  void onChange(Change<AuthState> change) {
    print(change.toString() + "chaaanged");
    super.onChange(change);
  }
}

class AuthState {}

class AuthInit extends AuthState {}

class AuthProgress extends AuthState {}

class AuthFirstLaunch extends AuthState {}

class AuthNoToken extends AuthState {}

class AuthLoginedIn extends AuthState {}
