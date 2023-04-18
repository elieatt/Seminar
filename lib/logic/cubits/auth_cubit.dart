import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seminar/data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  AuthCubit(this._repo) : super(AuthInit()) {
    startUpAuth();
  }

  Future<void> startUpAuth() async {
    emit(AuthProgress());
    bool isFirstLauch = await _repo.isFirstLaunch();
    if (isFirstLauch) {
      emit(AuthFirstLaunch());
      return;
    }
    emit(AuthNoToken());
  }

  Future<void> tutroialPassed() async {
    await _repo.tutorialPassed();
    emit(AuthNoToken());
  }

  Future<void> login(String userID, String password) async {
    emit(AuthProgress());
    Map<String, dynamic>? response;
    response = await _repo.login(userID, password);
    if (response == null) {
      emit(AuthFailed("Login failed please check your internet connection!"));
      return;
    }
    emit(AuthLoginedIn());
    return;
  }

  @override
  void onChange(Change<AuthState> change) {
    print(change.toString() + "chaaanged");
    super.onChange(change);
  }
}

// ********************************************************************Auth States****************************************************
class AuthState {}

class AuthInit extends AuthState {}

class AuthProgress extends AuthState {}

class AuthFirstLaunch extends AuthState {}

class AuthNoToken extends AuthState {}

class AuthLoginedIn extends AuthState {}

class AuthFailed extends AuthState {
  final String failureMessage;

  AuthFailed(this.failureMessage);
}
