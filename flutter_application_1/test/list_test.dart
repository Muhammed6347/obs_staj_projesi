import 'package:collection/collection.dart';
import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_application_1/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List Best of', () {
    List<GenericUser> users = [GenericUser('vb1', '11', 5), GenericUser('vb2', '11', 10), GenericUser('vb3', '11', 15)];
    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users.singleWhere(
        (element) => element.findUserName('x'),
        orElse: () {
          return GenericUser('name', 'id', 15);
        },
      );
      print(response);
    } catch (e) {
      print(e);
    }

    print(users.where((element) => element.money > 5));

    users.addAll([GenericUser('name', 'id', 15)]);
    users.lastWhere((element) => element.id == '5');
    users.take(10);
    users.remove(GenericUser('vb1', '11', 5));
    users.removeAt(2);
    users.removeWhere((element) => element.id == 11);

    users.indexOf(GenericUser('vb1', '11', 15));
    final result = users.indexWhere((element) => element.id == 11);
    if (result >= 0) {
      users[result] = const GenericUser('a', 'b', 15);
    }
    users.expand((element) => [GenericUser('a', '2', 15)]);
    //users.map((e) => e.money).where((element) => (element) > 5 );
  });
  test('List Best Of With Collection', () {
    List<GenericUser> users = [
      GenericUser('vb1', '11', 10),
      GenericUser('vb2', '11', 10),
      GenericUser('vb3', '11', 10),
    ];

    final response = users.singleWhereOrNull((element) => element.findUserName('x'));
    print(response);

    users.lastWhereOrNull((element) => element.id == '5');

    users.lastOrNull;
    users.forEachIndexed((index, element) {});
    users.sample(2);
    
    print(users.contains(GenericUser('vb1', '11', 10)));

    print(response);
  });
}
