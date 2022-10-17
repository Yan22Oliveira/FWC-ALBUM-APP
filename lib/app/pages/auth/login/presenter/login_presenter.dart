import '../view/login_view.dart';
import '../../../../core/core.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView>{
  Future<void> login({required String email, required String password});
}