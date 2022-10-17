import '../view/register_view.dart';
import '../../../../core/core.dart';

abstract class RegisterPresenter extends FwcPresenter<RegisterView> {

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });

}