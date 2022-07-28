// 环境配置
class EnvConfig {
  final String appTitle;
  final String appDomain;
  EnvConfig({
    required this.appTitle,
    required this.appDomain,
  });
}

// 获取的配置信息
class Env {
  // 获取到当前环境
  static const appEnv = String.fromEnvironment(EnvName.envKey);

  // 开发环境
  static final EnvConfig _debugConfig = EnvConfig(
    appTitle: "debugTitle",
    appDomain: "http://192.168.0.84:8201",
  );

  // 发布环境
  static final EnvConfig _releaseConfig = EnvConfig(
    appTitle: "releaseTitle",
    appDomain: "http://www.releasexxx.com",
  );

  static EnvConfig get config => _getConfig();

// 根据不同环境返回对应的环境配置
  static EnvConfig _getConfig() {
    switch (appEnv) {
      case EnvName.debug:
        return _debugConfig;
      case EnvName.release:
        return _releaseConfig;
      default:
        return _debugConfig;
    }
  }
}

// 声明的环境
abstract class EnvName {
  // 环境key
  static const String envKey = "DART_DEFINE_APP_ENV";

  // 环境value
  static const String debug = "debug";
  static const String release = "release";
}
