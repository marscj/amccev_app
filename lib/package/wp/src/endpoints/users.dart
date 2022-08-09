part of '../wp.dart';

class _Users {
  static const String _name = 'users';
  WordPressAPI _api;

  _Users(this._api);

  /// [GET] users from WP users endpoint
  ///
  /// `/wp/v2/users`
  Future<WPResponse> fetch({int? id, Map<String, dynamic>? args}) async {
    try {
      if (id != null) {
        final WPResponse res = await _api.fetch('$_name/$id', args: args);
        return WPResponse(
          statusCode: res.statusCode,
          data: User.fromMap(res.data),
          meta: res.meta,
        );
      }
      final WPResponse res = await _api.fetch('$_name', args: args);
      return WPResponse(
        statusCode: res.statusCode,
        data: parseUsers(res.data),
        meta: res.meta,
      );
    } catch (e) {
      rethrow;
    }
  }
}
