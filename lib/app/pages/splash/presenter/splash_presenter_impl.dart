import 'package:shared_preferences/shared_preferences.dart';

import './splash_presenter.dart';
import '../view/splash_view.dart';

class SplashPresenterImpl implements SplashPresenter {

  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');
    _view.logged(accessToken!=null);
  }

  @override
  set view(view) => _view = view;

}