import 'package:kuis_game/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDatabase {
  static final UserLocalDatabase instance = UserLocalDatabase.init();
  static Database? _database;
  final _dbName = 'myDatabase.db';
  final _tableName = 'user';

  UserLocalDatabase.init();

  Future<Database> get database async => _database != null ? _database! : await open();

  Future<Database> open() async {
    return await openDatabase(
      _dbName,
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute('''
        create table $_tableName (
        username text not null,
        imagePath text not null,
        level integer not null,
        point integer not null,
        nyawa integer not null
        )
        ''');
      },
    );
  }

  Future insert(UserModel user) async {
    Database db = await instance.database;
    await db.insert(_tableName, user.toMap());
  }

  Future getUser() async {
    Database db = await instance.database;
    try {
      List<Map<String, dynamic>> maps = await db.query(_tableName);
      return UserModel.fromMap(maps.first);
    } catch (e) {
      return null;
    }
  }

  Future setLevel(int level) async {
    Database db = await instance.database;
    UserModel user = await getUser();
    user.level = level;
    await db.update(_tableName, user.toMap());
  }

  Future setPoint(int point) async {
    Database db = await instance.database;
    UserModel user = await getUser();
    user.point = point;
    await db.update(_tableName, user.toMap());
  }

  Future setNyawa(int nyawa) async {
    Database db = await instance.database;
    UserModel user = await getUser();
    user.nyawa = nyawa;
    await db.update(_tableName, user.toMap());
  }

  Future delete(String username) async {
    Database db = await instance.database;
    await db.delete(_tableName, where: 'username = ?', whereArgs: [username]);
  }
}
