import 'package:flutter_register/domain/User.dart';

class Repository {
  var users = [
    User(
        id: "1",
        name: "Murphy",
        email: "teste@teste.com",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg"),
    const User(
        id: "2",
        name: "Regis",
        email: "teste@teste.com",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg"),
    const User(
        id: "3",
        name: "Luffy",
        email: "teste@teste.com",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg"),
    const User(
        id: "4",
        name: "Nami",
        email: "teste@teste.com",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg"),
  ];
}
