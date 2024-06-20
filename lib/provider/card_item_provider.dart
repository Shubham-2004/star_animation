import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_animation/main.dart';

class CardProvider extends ChangeNotifier {
  final Map<String, bool> _followStatus = {};
  final List<Widget> _cards = [
    CardItem(
      color: Colors.white,
      name: 'Bob',
      title: 'Software Engineer',
      mutualConnection: 'Alice and 2 others',
    ),
    CardItem(
      color: Colors.green[50]!,
      name: 'Alice',
      title: 'Product Manager',
      mutualConnection: 'Bob and 1 other',
    ),
    CardItem(
      color: Colors.yellow[50]!,
      name: 'Charlie',
      title: 'Data Scientist',
      mutualConnection: 'David and 3 others',
    ),
    CardItem(
      color: Colors.blue[50]!,
      name: 'David',
      title: 'UI/UX Designer',
      mutualConnection: 'Eve and 4 others',
    ),
    CardItem(
      color: Colors.red[50]!,
      name: 'Eve',
      title: 'Marketing Specialist',
      mutualConnection: 'Frank and 2 others',
    ),
    CardItem(
      color: Colors.orange[50]!,
      name: 'Frank',
      title: 'Business Analyst',
      mutualConnection: 'Grace and 1 other',
    ),
    CardItem(
      color: Colors.purple[50]!,
      name: 'Grace',
      title: 'HR Manager',
      mutualConnection: 'Heidi and 3 others',
    ),
    CardItem(
      color: Colors.cyan[50]!,
      name: 'Heidi',
      title: 'Finance Manager',
      mutualConnection: 'Ivan and 2 others',
    ),
    CardItem(
      color: Colors.lime[50]!,
      name: 'Ivan',
      title: 'Operations Manager',
      mutualConnection: 'Judy and 4 others',
    ),
    CardItem(
      color: Colors.teal[50]!,
      name: 'Judy',
      title: 'Sales Manager',
      mutualConnection: 'Kyle and 1 other',
    ),
    CardItem(
      color: Colors.amber[50]!,
      name: 'Kyle',
      title: 'Software Tester',
      mutualConnection: 'Leo and 3 others',
    ),
  ];

  List<Widget> get cards => List.unmodifiable(_cards);

  bool isFollowing(String name) {
    return _followStatus[name] ?? false;
  }

  void toggleFollow(String name) {
    _followStatus[name] = !isFollowing(name);
    notifyListeners();
  }

  void removeCard(String name) {
    _cards.removeWhere((card) {
      return (card as CardItem).name == name;
    });
    notifyListeners();
  }
}
