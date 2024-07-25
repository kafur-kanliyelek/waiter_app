import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';

class UserModel extends User {
  UserModel(
      {required super.name, required super.email, required super.password});

  factory UserModel.fromEntiy(User user) {
    return UserModel(
        name: user.name, email: user.email, password: user.password);
  }
}
