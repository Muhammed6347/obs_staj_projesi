import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final userManagement = UserManagement(AdminUser('vadmin', '1', 15, 1));
    final users = [GenericUser('vb', '11', 10), GenericUser('vb', '11', 10), GenericUser('vb', '11', 10)];
    final result = userManagement.calculateMoney(users);

    // ignore: unused_local_variable
    final response = userManagement.showNames<String>(users);
    expect(result, 45);
  });
}
