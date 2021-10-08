import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_smart_app/app/modules/login/bloc/login_event.dart';
import 'package:my_smart_app/app/modules/login/bloc/login_state.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository_interface.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(Loading()) {
    add(Find());
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Find) {
      yield* _mapFindToState(event);
    } else if (event is LoginWithGoogle) {
      yield* _mapLoginWithGoogleToState(event);
    } else if (event is LoginWithEmailEndPassword) {
      yield* _mapLoginWithEmailEndPasswordToState(event);
    }
  }

  Stream<LoginState> _mapFindToState(Find event) async* {
    yield Loaded();
  }

  Stream<LoginState> _mapLoginWithGoogleToState(LoginWithGoogle event) async* {
    yield Loading();
    try {
      User? user = await authRepository.getGoogleLogin();
      if (user != null) {
        yield Success();
      } else {
        yield Failure();
      }
    } catch (error) {
      print(error.toString());
      yield Failure();
    }
  }

  Stream<LoginState> _mapLoginWithEmailEndPasswordToState(
      LoginWithEmailEndPassword event) async* {
    yield Loading();
    try {
      await authRepository.getEmailEndPasswordLogin(
        email: event.email,
        password: event.password,
      );
      yield Success();
    } catch (error) {
      print(error.toString());
      yield Failure();
    }
  }
}
