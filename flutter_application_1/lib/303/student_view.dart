import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/login_view.dart';
import 'package:flutter_application_1/303/reqrest_recource/service/database_helper.dart';

class StudentView extends StatelessWidget {
  final Map<String, dynamic> student;
  const StudentView({Key? key, required this.student}) : super(key: key);

  Future<List<Map<String, dynamic>>> _getStudentGrades() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(
      '''
      SELECT c.course_name, g.midterm, g.final, g.letter_grade 
      FROM grades g
      JOIN courses c ON g.course_id = c.id
      WHERE g.student_id = ?
    ''',
      [student['id']],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Paneli - ${student['name']}'),
        actions: [
          // Çıkış Yap Butonu
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Çıkış Yap',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getStudentGrades(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final grades = snapshot.data!;
          if (grades.isEmpty) return const Center(child: Text('Kayıtlı dersiniz bulunmuyor.'));

          return ListView.builder(
            itemCount: grades.length,
            itemBuilder: (context, index) {
              final g = grades[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(g['course_name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Vize: ${g['midterm']} | Final: ${g['final']}'),
                  trailing: CircleAvatar(
                    backgroundColor: g['letter_grade'] == 'FF' ? Colors.red : Colors.green,
                    child: Text(g['letter_grade'], style: const TextStyle(color: Colors.white)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
