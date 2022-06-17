import '../service/base_network_users.dart';

class UserDataSource{
  static UserDataSource instance = UserDataSource();

  Future<Map<String, dynamic>> loadUsers(String text) {
    return BaseNetworkUsers.get(text);
  }
}