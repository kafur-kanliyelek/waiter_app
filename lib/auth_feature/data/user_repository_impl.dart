import 'package:richie_the_waiter/auth_feature/data/user_datasource.dart';
import 'package:richie_the_waiter/auth_feature/data/user_model.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});
  @override
  login(User user, mycontext) {
    userDataSource.login(
        userModel: UserModel.fromEntiy(user), mycontext: mycontext);
  }

  @override
  logout(mycontext) {
    userDataSource.logout(mycontext: mycontext);
  }

  @override
  signup(User user, mycontext) {
    userDataSource.signup(
        userModel: UserModel.fromEntiy(user), mycontext: mycontext);
  }
}
