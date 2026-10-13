import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_application_1/202/cache/user_model.dart';

class SharedCacheList extends StatefulWidget {
  const SharedCacheList({super.key});

  @override
  State<SharedCacheList> createState() => _SharedCacheListState();
}

class _SharedCacheListState extends LoadingStateFull<SharedCacheList> {
  late final UserCacheManager userCacheManager;
  List<User> _users = [];
  

  @override
  void initState() {
    super.initState();
    initalazedAndSave();
  }

  Future<void> initalazedAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init();

    userCacheManager = UserCacheManager(manager);
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor) : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                  onPressed: () async {
                    changeLoading();
                    await userCacheManager.savedItems(_users);
                    changeLoading();
                  },
                  icon: Icon(Icons.download_for_offline_rounded),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
              ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({required this.users});

  final List<User> users;

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
