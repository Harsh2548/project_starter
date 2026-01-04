import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'errors.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE errors (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            api TEXT,
            request TEXT,
            response TEXT,
            headers TEXT,
            error TEXT,
            statusCode INTEGER,
            timestamp TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertError(Map<String, dynamic> error) async {
    final db = await database;
    await db.insert('errors', error);
  }

  Future<List<Map<String, dynamic>>> getErrors() async {
    final db = await database;
    return await db.query('errors', orderBy: "id DESC");
  }

  Future<void> clearErrors() async {
    final db = await database;
    await db.delete('errors');
  }
}