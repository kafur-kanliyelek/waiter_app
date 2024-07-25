import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_repository.dart';

class SignUpUseCase {
  final UserRepository userRepository;

  SignUpUseCase({required this.userRepository});

  call(User user, mycontext) {
    userRepository.signup(user, mycontext);
  }
}
