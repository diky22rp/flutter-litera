import 'package:shared_preferences/shared_preferences.dart';

abstract class HubLocalDataSource {
  Future<void> cacheSelectedHubId(String hubId);
  Future<String?> getCachedHubId();
}

const String cachedHubId = 'CACHED_HUB_ID';

class HubLocalDataSourceImpl implements HubLocalDataSource {
  final SharedPreferences sharedPreferences;

  HubLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheSelectedHubId(String hubId) async {
    await sharedPreferences.setString(cachedHubId, hubId);
  }

  @override
  Future<String?> getCachedHubId() async {
    return sharedPreferences.getString(cachedHubId);
  }
}
