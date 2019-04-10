import 'package:shared_preferences/shared_preferences.dart';

///flutter中存储数据用的sp 待完善
class SpUtil {

  void putObject(Object o) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', 1);
    prefs.setString("", "");
  }

  Object getObject(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

}
