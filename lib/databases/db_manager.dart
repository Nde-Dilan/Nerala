import 'package:anki_like_app/models/topic_stats.dart';
import 'package:anki_like_app/models/word.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._internal();

  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;

  final String _db = "nerala.db";
  final String _wordsTable = "words";
  final String _statsTable = "stats";
  final String _column1 = 'topic';
  final String _column2 = 'english';
  final String _column3 = 'character';
  final String _column4 = 'pinyin';
  final String _columnRoundCount = 'roundCount';
  final String _columnCardCount = 'cardCount';
  final String _columnCorrectCount = 'correctCount';
  final String _columnIncorrectCount = 'incorrectCount';
  final String _columnCorrectPercentage = 'correctPercentage';

  Future<Database> initDatabase() async {
    final String devicesPath = await getDatabasesPath();
    final String path = '$devicesPath/$_db';

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) {
      db.execute('''
      CREATE TABLE $_wordsTable (
        $_column1 TEXT,
        $_column2 TEXT PRIMARY KEY,
        $_column3 TEXT,
        $_column4 TEXT
      )
      ''');

      db.execute('''
      CREATE TABLE $_statsTable (
        $_column1 TEXT PRIMARY KEY,
        $_columnRoundCount INTEGER,
        $_columnCardCount INTEGER,
        $_columnCorrectCount INTEGER,
        $_columnIncorrectCount INTEGER,
        $_columnCorrectPercentage INTEGER
      )
      ''');
    });
  }

  Future<void> insertWord(Word word) async {
    Database db = await initDatabase();
    await db.insert(_wordsTable, word.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Word>> selectWords({int? limit}) async {
    Database db = await initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_wordsTable, limit: limit, orderBy: 'RANDOM()');
    return List.generate(maps.length, (index) {
      return Word.fromMap(maps[index]);
    });
  }

  Future<void> removeWord(String english) async {
    Database db = await initDatabase();
    await db.delete(_wordsTable, where: '$_column2 = ?', whereArgs: [english]);
  }

  Future<void> removeAllWords() async {
    Database db = await initDatabase();
    await db.delete(_wordsTable);
  }

  Future<void> removeDatabase() async {
    final devicesPath = await getDatabasesPath();
    final path = '$devicesPath/$_db';
    await deleteDatabase(path);
  }

  Future<void> insertTopicStats(String topic, TopicStats stats) async {
    Database db = await initDatabase();
    await db.insert(_statsTable, {...stats.toMap(), _column1: topic}, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<TopicStats?> selectTopicStats(String topic) async {
    Database db = await initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_statsTable, where: '$_column1 = ?', whereArgs: [topic]);
    if (maps.isNotEmpty) {
      return TopicStats.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<TopicStats>> selectAllTopicStats() async {
    Database db = await initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_statsTable);
    return List.generate(maps.length, (index) {
      return TopicStats.fromMap(maps[index]);
    });
  }

  Future<void> updateTopicStats(String topic, TopicStats stats) async {
    Database db = await initDatabase();
    await db.update(_statsTable, stats.toMap(), where: '$_column1 = ?', whereArgs: [topic]);
  }

  Future<void> removeTopicStats(String topic) async {
    Database db = await initDatabase();
    await db.delete(_statsTable, where: '$_column1 = ?', whereArgs: [topic]);
  }

  Future<void> removeAllTopicStats() async {
    Database db = await initDatabase();
    await db.delete(_statsTable);
  }
}