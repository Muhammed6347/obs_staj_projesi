class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;
  PostModel2(this.userId, this.id, this.title, this.body);
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;
  int get userId => _userId;

  PostModel5({required this._userId, required this._id, required this._title, required this._body});
}

class PostModel6 {
  // ignore: unused_field
  late final int _userId;
  // ignore: unused_field
  late final int _id;
  // ignore: unused_field
  late final String _title;
  // ignore: unused_field
  late final String _body;

  PostModel6({required this._userId, required this._id, required this._title, required this._body});
}

class PostModel7 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  PostModel7({int userId = 0, int id = 0, String title = '', String body = ''})
    : _userId = userId,
      _id = id,
      _title = title,
      _body = body;
}

class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void UpdateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({int? userId, int? id, String? title, String? body}) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
