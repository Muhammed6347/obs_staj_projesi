import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/login_view.dart';
import 'package:flutter_application_1/303/reqrest_recource/service/database_helper.dart';

class TeacherView extends StatefulWidget {
  final Map<String, dynamic> teacher;
  const TeacherView({super.key, required this.teacher});

  @override
  _TeacherViewState createState() => _TeacherViewState();
}

class _TeacherViewState extends State<TeacherView> {
  late Future<List<Map<String, dynamic>>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  void _loadCourses() {
    _coursesFuture = DatabaseHelper.instance.getTeacherCourses(widget.teacher['id']);
  }

  // Yeni Ders Ekleme Diyaloğu
  void _showAddCourseDialog(BuildContext context) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yeni Ders Ekle'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Ders Adı'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty) {
                await DatabaseHelper.instance.addCourse(nameController.text, widget.teacher['id']);
                Navigator.pop(context);
                _loadCourses(); // Listeyi yenile
              }
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akademisyen Paneli - ${widget.teacher['name']}'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCourseDialog(context),
        child: const Icon(Icons.add),
        tooltip: 'Yeni Ders Ekle',
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _coursesFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final courses = snapshot.data!;
          if (courses.isEmpty) return const Center(child: Text('Size atanmış ders bulunamadı.'));

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course['course_name']),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CourseGradesView(course: course)));
                },
              );
            },
          );
        },
      ),
    );
  }
}

class CourseGradesView extends StatefulWidget {
  final Map<String, dynamic> course;
  const CourseGradesView({Key? key, required this.course}) : super(key: key);

  @override
  _CourseGradesViewState createState() => _CourseGradesViewState();
}

class _CourseGradesViewState extends State<CourseGradesView> {
  late Future<List<Map<String, dynamic>>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  void _fetchStudents() {
    setState(() {
      _studentsFuture = DatabaseHelper.instance.getCourseStudents(widget.course['id']);
    });
  }

  void _editGrade(BuildContext context, Map<String, dynamic> studentGrade) {
    final midtermController = TextEditingController(text: studentGrade['midterm']?.toString() ?? '0');
    final finalController = TextEditingController(text: studentGrade['final']?.toString() ?? '0');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${studentGrade['student_name']} - Not Girişi'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: midtermController,
              decoration: const InputDecoration(labelText: 'Vize'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: finalController,
              decoration: const InputDecoration(labelText: 'Final'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
          ElevatedButton(
            onPressed: () async {
              double m = double.tryParse(midtermController.text) ?? 0;
              double f = double.tryParse(finalController.text) ?? 0;
              await DatabaseHelper.instance.updateGrade(studentGrade['grade_id'], m, f);
              Navigator.pop(context);
              _fetchStudents();
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.course['course_name']} - Öğrenciler')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _studentsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final students = snapshot.data!;
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final s = students[index];
              return ListTile(
                title: Text(s['student_name']),
                subtitle: Text('Vize: ${s['midterm']} | Final: ${s['final']} | Harf: ${s['letter_grade']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editGrade(context, s),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
