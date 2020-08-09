import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_register/data/Repository.dart';
import 'package:flutter_register/domain/User.dart';

class UserProvider with ChangeNotifier {
  var repository = new Repository();

  List<User> get all {
    return repository.users;
  }

  int get count {
    return repository.users.length;
  }

  void add(String name, String email, String imageUrl) {
    var id = Random().nextDouble().toString();
    var user = User(id: id, name: name, email: email, imageUrl: imageUrl);
    repository.users.add(user);
    notifyListeners();
  }

  void remove(User user) {
    if (user == null) return;

    repository.users.remove(user);
    notifyListeners();
  }

  //TODO fix user update
  void update(String userId, String name, String email, String imageUrl) {
    repository.users.asMap().forEach((index, element) => {
          if (element.id == userId)
            {
              repository.users.add(User(
                  id: userId, name: name, email: email, imageUrl: imageUrl))
            }
        });

    notifyListeners();
  }
}
