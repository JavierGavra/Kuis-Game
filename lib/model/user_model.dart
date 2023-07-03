class UserModel {
  String? username;
  String? imagePath;
  int? level;
  int? point;
  int? nyawa;

  UserModel({
    required this.username,
    required this.imagePath,
    required this.level,
    required this.point,
    required this.nyawa,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'username': username,
      'imagePath': imagePath,
      'level': level,
      'point': point,
      'nyawa': nyawa
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    imagePath = map['imagePath'];
    level = map['level'];
    point = map['point'];
    nyawa = map['nyawa'];
  }
}
