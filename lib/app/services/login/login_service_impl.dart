import 'package:shared_preferences/shared_preferences.dart';

import './login_service.dart';
import '../../repository/auth/auth_repository.dart';

class LoginServiceImpl implements LoginService {

  final AuthRepository authRepository;
  LoginServiceImpl({required this.authRepository,});

  @override
  Future<void> execute({
    required String email,
    required String password,
  }) async {
   final accessToken = await authRepository.login(
     email: email,
     password: password,
   );
   final sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString('accessToken', accessToken);
  }

}