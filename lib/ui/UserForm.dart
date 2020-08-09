import 'package:flutter/material.dart';
import 'package:flutter_register/domain/User.dart';
import 'package:flutter_register/provider/UserProvider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  var _name = "";

  var _email = "";

  var _imageUrl = "";

   User _user;

  void _loadUserData(User user) {
    if (user != null) {
      _name = user.name;
      _email = user.email;
      _imageUrl = user.imageUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _user = ModalRoute
        .of(context)
        .settings
        .arguments;

    _loadUserData(_user);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Register form"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                var canSave = _form.currentState.validate();
                if (canSave) {
                  _form.currentState.save();

                  if (_user != null) {
                    Provider.of<UserProvider>(context, listen: false)
                        .update(_user.id, _name, _email, _imageUrl);
                  } else {
                    Provider.of<UserProvider>(context, listen: false)
                        .add(_name, _email, _imageUrl);
                    Navigator.of(context).pop();
                  }
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: "Nome"),
                onSaved: (value) => _name = value,
                validator: (value) {
                  if (value.length <= 2) {
                    return "Short text";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: "Email"),
                onSaved: (value) => _email = value,
                validator: (value) {
                  if (value.length <= 2) {
                    return "Short text";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(labelText: "Image url"),
                onSaved: (value) => _imageUrl = value,
                validator: (value) {
                  if (value.length <= 2) {
                    return "Short text";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
