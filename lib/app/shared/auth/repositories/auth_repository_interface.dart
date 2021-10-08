abstract class IAuthRepository {
  Future getUser();
  Future<String> getToken();
  Future getEmailEndPasswordLogin(
      {required String email, required String password});
  Future getGoogleLogin();
  Future logOut();
}
