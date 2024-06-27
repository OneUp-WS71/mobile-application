import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mobile_application/reminders/domain/entities/reminder.dart';
import 'package:mobile_application/reminders/domain/repositories/reminder_repository.dart';

import '../../domain/entities/appointment_reminder.dart';
import '../../domain/entities/medicine_reminder.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SQLiteReminderRepository implements ReminderRepository {
  Database? _database;


  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'reminders.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE reminders(id TEXT PRIMARY KEY, '
              'title TEXT, '
              'time TEXT, '
              'frequency TEXT, '
              'dosage TEXT, '
              'location TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> saveReminder(Reminder reminder) async {
    final db = await database;
    await db.insert(
      'reminders',
      {
        'id': reminder.id,
        'title': reminder.title,
        'time': reminder.time.toIso8601String(),
        if (reminder is MedicineReminder) 'frequency': reminder.frequency.join(','),
        if (reminder is MedicineReminder) 'dosage': reminder.dosage,
        if (reminder is AppointmentReminder) 'location': reminder.location,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Reminder>> getAllReminders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reminders');

    return List.generate(maps.length, (i) {
      if (maps[i]['dosage'] != null) {
        return MedicineReminder(
          id: maps[i]['id'],
          title: maps[i]['title'],
          time: DateTime.parse(maps[i]['time']),
          dosage: maps[i]['dosage'],
          frequency: (maps[i]['frequency'] as String).split(','),
        );
      } else {
        return AppointmentReminder(
          id: maps[i]['id'],
          title: maps[i]['title'],
          time: DateTime.parse(maps[i]['time']),
          location: maps[i]['location'],
        );
      }
    });
  }

  @override
  Future<void> deleteReminder(String id) async {
    final db = await database;
    await db.delete(
      'reminders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}