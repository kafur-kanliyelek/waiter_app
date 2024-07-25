import 'package:richie_the_waiter/auth_feature/domain/user_repository.dart';

class LogoutUseCase {
  final UserRepository userRepository;

  LogoutUseCase({required this.userRepository});

  call(mycontext) {
    userRepository.logout(mycontext);
  }
}
