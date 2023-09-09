import 'package:md_ponto_app/src/data/repositories/models/user_model.dart';

class UsersMocks {
  static List<UserModel> mockUsers = [
    UserModel(
      uid: "user123",
      firstName: "João",
      lastName: "Silva",
      group: "A",
      userType: "regular",
      email: "joao@example.com",
      frequence: 0.85,
      photo: 1,
    ),
    UserModel(
      uid: "user456",
      firstName: "Maria",
      lastName: "Santos",
      group: "B",
      userType: "admin",
      email: "maria@example.com",
      frequence: 0.92,
      photo: 2,
    ),
    UserModel(
      uid: "user789",
      firstName: "Pedro",
      lastName: "Ferreira",
      group: "A",
      userType: "regular",
      email: "pedro@example.com",
      frequence: 0.78,
      photo: 3,
    ),
    UserModel(
      uid: "user789",
      firstName: "Pedro",
      lastName: "Ferreira",
      group: "A",
      userType: "regular",
      email: "pedro@example.com",
      frequence: 0.78,
      photo: 5,
    ),
    UserModel(
      uid: "user789",
      firstName: "Pedro",
      lastName: "Ferreira",
      group: "A",
      userType: "regular",
      email: "pedro@example.com",
      frequence: 0.78,
      photo: 4,
    ),
  ];
}
