part of 'model.dart';

class User {
  final int id;
  final String title, subtitle;

  User({this.id, this.title, this.subtitle});

  factory User.fromJson(Map<String, dynamic> map){
    return User(id: map['id'], title: map['title'], subtitle: map['body']);
  }

  Map<String, dynamic> toJson(){
    return {'id': id, 'title': title, 'subtitle': subtitle};
  }

  @override
  String toString(){
    return 'User(id: $id, title: $title, subtitle: $subtitle)';
  }
}

List<User> userFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<User>.from(data.map((e) => User.fromJson(e)));
}

String userToJson(User data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}