class AuthNS {
  Future<Map<String, dynamic>?> login(String userID, String password) async {
    Map<String, dynamic> parsedBody = {"message": "login success"};
    return parsedBody;
  }
}
