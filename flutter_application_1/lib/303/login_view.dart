import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/reqrest_recource/service/database_helper.dart';
import 'package:flutter_application_1/303/student_view.dart';
import 'package:flutter_application_1/303/teacher_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController(text: 'hoca@obs.com');
  final _passwordController = TextEditingController(text: '123');
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    final user = await DatabaseHelper.instance.loginUser(_emailController.text.trim(), _passwordController.text.trim());

    setState(() => _isLoading = false);

    if (user != null) {
      String role = user['role'];
      if (role == 'teacher') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => TeacherView(teacher: user)));
      } else if (role == 'student') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => StudentView(student: user)));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Admin paneli henüz bu sayfada bağlanmadı.')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hatalı e-posta veya şifre!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OBS Otomasyon Giriş')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-Posta'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: _login, child: const Text('Giriş Yap')),
          ],
        ),
      ),
    );
  }
}
