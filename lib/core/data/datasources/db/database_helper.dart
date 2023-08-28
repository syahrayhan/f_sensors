import 'package:flutter_sensor/core/data/models/note_table.dart';
import 'package:flutter_sensor/core/data/models/user_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database = await _initDb();
    return _database;
  }

  static const String _tbUser = 'user_sensor';
  static const String _tbNotes = 'notes';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final dbPath = '$path/flutter_sensor.db';

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tbUser (
        id INTEGER PRIMARY KEY,
        account TEXT,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $_tbNotes (
        id INTEGER PRIMARY KEY,
        text TEXT,
        date TEXT,
        time TEXT
      )
    ''');
  }

  Future<void> insertNote(NoteTable note) async {
    final db = await database;
    await db!.insert(
      'notes',
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<NoteTable>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('notes');
    return List.generate(
      maps.length,
      (i) => NoteTable.fromMap(maps[i]),
    );
  }

  Future<void> updateNote(NoteTable note) async {
    final db = await database;
    await db!.update(
      'notes',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(int id) async {
    final db = await database;
    await db!.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertUser(UserTable user) async {
    final db = await database;
    final userToJson = user.toJson();
    await db!.insert(_tbUser, userToJson);
  }

  Future<Map<String, dynamic>?>? findUserByAccount(String account) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query(
      _tbUser,
      where: 'account = ?',
      whereArgs: [account],
    );

    return result.isNotEmpty ? result[0] : null;
  }

  Future<Map<String, dynamic>?>? findUserByAccountAndPassword(
      String account, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query(
      _tbUser,
      where: 'account = ? AND password = ?',
      whereArgs: [account, password],
    );

    return result.isNotEmpty ? result[0] : null;
  }
}
