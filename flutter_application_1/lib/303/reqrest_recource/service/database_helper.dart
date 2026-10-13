import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('obs_system.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // Kullanıcılar Tablosu (Roller: admin, teacher, student)
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL
      )
    ''');

    // Dersler Tablosu
    await db.execute('''
      CREATE TABLE courses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        course_name TEXT NOT NULL,
        teacher_id INTEGER,
        FOREIGN KEY (teacher_id) REFERENCES users (id)
      )
    ''');

    // Notlar Tablosu
    await db.execute('''
      CREATE TABLE grades (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER,
        course_id INTEGER,
        midterm REAL,
        final REAL,
        letter_grade TEXT,
        FOREIGN KEY (student_id) REFERENCES users (id),
        FOREIGN KEY (course_id) REFERENCES courses (id)
      )
    ''');

    // Test için örnek veriler ekleyelim
    await db.insert('users', {'name': 'Admin Personel', 'email': 'admin@obs.com', 'password': '123', 'role': 'admin'});
    await db.insert('users', {'name': 'Ahmet Hoca', 'email': 'hoca@obs.com', 'password': '123', 'role': 'teacher'});
    await db.insert('users', {
      'name': 'Mehmet Öğrenci',
      'email': 'ogrenci@obs.com',
      'password': '123',
      'role': 'student',
    });

    await db.insert('courses', {'course_name': 'Mikrodenetleyiciler', 'teacher_id': 2});
    await db.insert('grades', {'student_id': 3, 'course_id': 1, 'midterm': 0.0, 'final': 0.0, 'letter_grade': '-'});
  }

  // DatabaseHelper içindeki addCourse fonksiyonunu bu mantıkla güncelle:
  Future<void> addCourse(String courseName, int teacherId) async {
    final db = await instance.database;

    // 1. Dersi ekle
    int courseId = await db.insert('courses', {'course_name': courseName, 'teacher_id': teacherId});

    // 2. Sistemdeki tüm öğrencileri al
    List<Map<String, dynamic>> allStudents = await db.query('students');

    // 3. Her öğrenciyi bu yeni derse '0' not ile 'grades' tablosuna ekle
    for (var student in allStudents) {
      await db.insert('grades', {'student_id': student['id'], 'course_id': courseId, 'midterm': 0, 'final': 0});
    }
  }

  // Kullanıcı Giriş Kontrolü
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await instance.database;
    final result = await db.query('users', where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Hocanın Derslerini Getir
  Future<List<Map<String, dynamic>>> getTeacherCourses(int teacherId) async {
    final db = await instance.database;
    return await db.query('courses', where: 'teacher_id = ?', whereArgs: [teacherId]);
  }

  // Derse Ait Öğrencileri ve Notları Getir
  Future<List<Map<String, dynamic>>> getCourseStudents(int courseId) async {
    final db = await instance.database;
    return await db.rawQuery(
      '''
      SELECT g.id as grade_id, u.name as student_name, g.midterm, g.final, g.letter_grade 
      FROM grades g
      JOIN users u ON g.student_id = u.id
      WHERE g.course_id = ?
    ''',
      [courseId],
    );
  }

  // Not Güncelleme ve Harf Notu Hesaplama
  Future<void> updateGrade(int gradeId, double midterm, double finalExam) async {
    final db = await instance.database;
    double total = (midterm * 0.4) + (finalExam * 0.6);
    String letter = _calculateLetter(total);

    await db.update(
      'grades',
      {'midterm': midterm, 'final': finalExam, 'letter_grade': letter},
      where: 'id = ?',
      whereArgs: [gradeId],
    );
  }

  String _calculateLetter(double total) {
    if (total >= 90) return 'AA';
    if (total >= 80) return 'BA';
    if (total >= 70) return 'BB';
    if (total >= 60) return 'CB';
    if (total >= 50) return 'CC';
    return 'FF';
  }
}
