import 'package:connectivity/connectivity.dart';
import 'package:settings_screen/shared/app_exceptions.dart';

const String _BASE_URL = 'https://jsonplaceholder.typicode.com/';
const String USERS_SERVICE = _BASE_URL + 'users';

Future<void> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile &&
      connectivityResult != ConnectivityResult.wifi)
    throw NoInternetConnectionException();
}
