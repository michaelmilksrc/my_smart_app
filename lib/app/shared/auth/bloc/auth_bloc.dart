import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_smart_app/app/shared/auth/bloc/auth_event.dart';
import 'package:my_smart_app/app/shared/auth/bloc/auth_state.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:my_smart_app/app/shared/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(NotLogged());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is IsLogged) {
      yield* _mapIsLoggedToState(event);
    } else if (event is GetUser) {
      yield* _mapGetUserToState(event);
    } else if (event is LoginWithGoogle) {
      yield* _mapLoginWithGoogleToState(event);
    } else if (event is LoginWithEmailEndPassword) {
      yield* _mapLoginWithEmailEndPasswordToState(event);
    }
  }

  Stream<AuthState> _mapIsLoggedToState(AuthEvent event) async* {}

  Stream<AuthState> _mapGetUserToState(GetUser event) async* {
    final User? user = await authRepository.getUser();
    if (user != null) {
      final UserModel userModel =
          UserModel(id: user.uid, name: user.displayName!);
      yield Logged(userModel);
    } else {
      yield NotLogged();
    }
  }

  Stream<AuthState> _mapLoginWithGoogleToState(LoginWithGoogle event) async* {
    await authRepository.getGoogleLogin();
    final User? user = await authRepository.getUser();
    if (user != null) {
      final UserModel userModel =
          UserModel(id: user.uid, name: user.displayName!);
      yield Logged(userModel);
    } else {
      yield NotLogged();
    }
  }

  Stream<AuthState> _mapLoginWithEmailEndPasswordToState(
      LoginWithEmailEndPassword event) async* {
    await authRepository.getEmailEndPasswordLogin(
      email: event.email,
      password: event.password,
    );
    final User? user = await authRepository.getUser();
    if (user != null) {
      final UserModel userModel =
          UserModel(id: user.uid, name: user.displayName!);
      yield Logged(userModel);
    } else {
      yield NotLogged();
    }
  }
}
