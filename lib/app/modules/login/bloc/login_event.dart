abstract class LoginEvent {}

class Find implements LoginEvent {}

class LoginWithGoogle implements LoginEvent {}

class LoginWithEmailEndPassword implements LoginEvent {
  final String email;
  final String password;

  LoginWithEmailEndPassword({required this.email, required this.password});
}
