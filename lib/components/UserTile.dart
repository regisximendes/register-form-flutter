import 'package:flutter/material.dart';
import 'package:flutter_register/domain/User.dart';
import 'package:flutter_register/navigation/AppNavigaiton.dart';
import 'package:flutter_register/provider/UserProvider.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);

    return ListTile(
      leading: getAvatar(),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppNavigation.FORM, arguments: user);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.amber,
              onPressed: () {
                userProvider.remove(user);
              },
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar getAvatar() {
    return user.imageUrl == null || user.imageUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.imageUrl));
  }
}
