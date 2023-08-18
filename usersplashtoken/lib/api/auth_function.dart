abstract class IAuthenticationApi {
  login(String username, String password);
}

// class UserCred {
//   List userData = [];
// }

class AuthenticationApi implements IAuthenticationApi {
  var userData = {
    'yash': 'yashjani',
    'prabha': 'prabhatamilan',
    'aniket': 'aniketdubey',
    'prasad': 'dhomble'
  };

  @override
  login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
