class User {
  // int userId;
  String login;
  String mp;
  

  User({ required this.login, required this.mp,});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        // userId: responseData['id'],
        login: responseData['login'],
        mp: responseData['mp'],
        
    );
  }
}