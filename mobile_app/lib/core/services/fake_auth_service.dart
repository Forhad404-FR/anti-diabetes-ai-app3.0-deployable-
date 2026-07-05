class FakeAuthService {
  // temporary fake user

  static const String _fakeEmail = "test@gmail.com";
  static const String _fakePassword = "123456";
  static Future<bool> login(String email, String password) async{
    await Future.delayed(const Duration(seconds: 1));// sumulate network delay
    if(email == _fakeEmail && password ==_fakePassword){
      return true;
    }
    return false;
  }
  static Future<bool> register(String email, String password) async{
    await Future.delayed(const Duration(seconds: 1));
    // for now alws rtrn true
    return true;
  }
}
