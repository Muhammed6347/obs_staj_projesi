import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'a');

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1();
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'b', 'a');
    user2.body = 'a';

    // ignore: unused_local_variable
    final user3 = PostModel3(1, 2, 'b', 'a');
    // user3.body = 'a';

    // ignore: unused_local_variable
    final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'b');
    // user4.body = 'a';

    final user5 = PostModel5(userId: 1, id: 2, title: 'a', body: 'b');
    user5.userId;

    // ignore: unused_local_variable
    final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');

    // ignore: unused_local_variable
    final user7 = PostModel7();

    //service
    // ignore: unused_local_variable
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: 'vb');
            user9.UpdateBody('muhammed');
          });
        },
      ),

      appBar: AppBar(title: Text(user9.body ?? 'not has any title')),
    );
  }
}
