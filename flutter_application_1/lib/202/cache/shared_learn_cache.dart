import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_model.dart';

class SharedLearnCache extends StatefulWidget {
  const SharedLearnCache({super.key});

  @override
  State<SharedLearnCache> createState() => _SharedLearnCacheState();
}

class _SharedLearnCacheState extends LoadingStateFull<SharedLearnCache> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItem;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItem = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    getDefaultValues();
    changeLoading();
  }

  void getDefaultValues() {
    final value = _manager.getString(SharedKeys.counter);

    if (value != null) {
      _onChangeValue(value);
    }
  }

  void _onChangeValue(String value) {
    final intValue = int.tryParse(value);

    if (intValue != null) {
      setState(() {
        _currentValue = intValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [if (isLoading) const Padding(padding: EdgeInsets.all(12), child: CircularProgressIndicator())],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Sayı giriniz'),
              onChanged: _onChangeValue,
            ),
            Expanded(child: _UserListView()),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_saveValueButton(), const SizedBox(width: 10), _removeValueButton()],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      heroTag: "save",
      child: const Icon(Icons.save),
      onPressed: () async {
        changeLoading();

        await _manager.saveString(SharedKeys.counter, _currentValue.toString());

        changeLoading();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kayıt başarılı")));
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      heroTag: "remove",
      child: const Icon(Icons.delete),
      onPressed: () async {
        changeLoading();

        await _manager.removeItem(SharedKeys.counter);

        setState(() {
          _currentValue = 0;
        });

        changeLoading();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kayıt silindi")));
      },
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView();

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(
              users[index].url ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        );
      },
    );
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [User('vb', '10', 'vb10.dev'), User('vb1', '11', 'vb10.dev'), User('vb2', '12', 'vb10.dev')];
  }
}

abstract class LoadingStateFull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
