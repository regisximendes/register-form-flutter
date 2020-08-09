import 'package:flutter/material.dart';
import 'package:flutter_register/navigation/AppNavigaiton.dart';
import 'package:flutter_register/provider/UserProvider.dart';
import 'package:flutter_register/ui/UserForm.dart';
import 'package:flutter_register/ui/UserList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => UserProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserList(),
        routes: {AppNavigation.FORM: (_) => UserForm()},
      ),
    );
  }
}
