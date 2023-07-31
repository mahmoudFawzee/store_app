class UsersService {
  UsersService._internal();
  static final _instance = UsersService._internal();
  factory UsersService() => _instance;
  void createUser(){}
  void deleteUser(){}
  void readUser(){}
}
