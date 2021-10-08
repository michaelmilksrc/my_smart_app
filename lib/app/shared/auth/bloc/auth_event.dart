abstract class AuthEvent {}

class IsLogged implements AuthEvent {}

class LoginWithGoogle implements AuthEvent {}

class LoginWithEmailEndPassword implements AuthEvent {
  final String email;
  final String password;

  LoginWithEmailEndPassword({required this.email, required this.password});
}

class GetUser implements AuthEvent {}
