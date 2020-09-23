part of 'services.dart';

class UserService {
  static Future<List<User>> getUser({http.Client client}) async{
    String url = 'https://jsonplaceholder.typicode.com/posts';

    client ??= http.Client();

    final response = await client.get(url);
    return userFromJson(response.body);

  }
}
