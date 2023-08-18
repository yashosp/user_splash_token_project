import 'package:usersplashtoken/repo/repo_result.dart';

abstract class IAuthenticationRepository {
  Future<Result> login(String username, String password);
  Future<Result> logout();
  Future<DataResult<bool>> isLoggedIn();
  Future<DataResult<bool>> isLoginFresh();
}

class AuthenticationRepository implements IAuthenticationRepository {}
