import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  call(User user, mycontext) {
    userRepository.login(user, mycontext);
  }
}
