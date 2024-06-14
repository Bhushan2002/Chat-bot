   
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class Pref {
  static late Box _box;
  static void initialize() async {
    final dir = await getApplicationCacheDirectory();

    Hive.defaultDirectory = dir.path;
    _box = Hive.box(name: "myData");
  }

  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true);

  static set showOnboarding(bool v) => _box.put('showOnboarding', v);
}
