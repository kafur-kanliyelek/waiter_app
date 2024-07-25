import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';

abstract class UserRepository {
  login(User user, mycontext);
  signup(User user, mycontext);
  logout(mycontext);
}
