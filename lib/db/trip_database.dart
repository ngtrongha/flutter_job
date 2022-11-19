import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/trips/trip_model.dart';

class TripsDatabase {
  static final TripsDatabase instance = TripsDatabase._init();

  static Database? _database;

  TripsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('trip.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes( 
  ${TripFields.id} $idType, 
  ${TripFields.name} $textType,
  ${TripFields.destionation} $textType,
  ${TripFields.require} $textType,
  ${TripFields.date} $textType,
  ${TripFields.des} $textType
  )
''');
  }

  Future<TripModel> create(TripModel trip) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, trip.toJson());
    return trip.copyWith(id: id);
  }

  Future<TripModel> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: TripFields.values,
      where: '${TripFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TripModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<TripModel>> readAllNotes() async {
    final db = await instance.database;

    const orderBy = '${TripFields.date} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => TripModel.fromJson(json)).toList();
  }

  Future<int> update(TripModel note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${TripFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${TripFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
