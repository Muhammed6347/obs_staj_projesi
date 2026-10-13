import 'dart:convert';

import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> savedItems(final List<User> items) async {
    //compute
    final _items = items.map((element) => jsonEncode(element)).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    //compute
    final _itemsString = sharedManager.getStrings(SharedKeys.users);
    if (_itemsString?.isNotEmpty ?? false) {
      return _itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
