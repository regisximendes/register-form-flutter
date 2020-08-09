import 'package:flutter/material.dart';
import 'package:flutter_register/components/UserTile.dart';
import 'package:flutter_register/navigation/AppNavigaiton.dart';
import 'package:flutter_register/provider/UserProvider.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Users List"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppNavigation.FORM);
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: userProvider.count,
          itemBuilder: (ctx, index) =>
              UserTile(userProvider.all.elementAt(index)),
        ));
  }
}
