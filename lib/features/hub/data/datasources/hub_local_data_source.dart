import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String cachedHubId = 'CACHED_HUB_ID';
const String cachedHubName = 'CACHED_HUB_NAME';

abstract class HubLocalDataSource {
  Future<void> cacheHubData(String id, String name);
  Future<String?> getCachedHubId();
  Future<String?> getCachedHubName();
}

@LazySingleton(as: HubLocalDataSource)
class HubLocalDataSourceImpl implements HubLocalDataSource {
  final SharedPreferences sharedPreferences;

  HubLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheHubData(String id, String name) async {
    await sharedPreferences.setString(cachedHubId, id);
    await sharedPreferences.setString(cachedHubName, name);
  }

  @override
  Future<String?> getCachedHubId() async {
    return sharedPreferences.getString(cachedHubId);
  }

  @override
  Future<String?> getCachedHubName() async {
    return sharedPreferences.getString(cachedHubName);
  }
}
