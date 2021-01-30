import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/repository/api_client_provider.dart';

class Repository {
  final _apiClient = ApiClientProvider();

  Future<List<User>> fetchUsers() async {
    return await _apiClient.fetchUsers();
  }
}
