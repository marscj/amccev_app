part of '../wp.dart';

class _Pages {
  static const String _name = 'pages';
  WordPressAPI _api;

  _Pages(this._api);

  /// [GET] pages from WP pages endpoint
  ///
  /// `/wp/v2/pages`
  Future<WPResponse> fetch({int? id, Map<String, dynamic>? args}) async {
    try {
      if (id != null) {
        final WPResponse res = await _api.fetch('$_name/$id', args: args);
        return WPResponse(
          statusCode: res.statusCode,
          data: Page.fromMap(res.data),
          meta: res.meta,
        );
      }
      final WPResponse res = await _api.fetch('$_name', args: args);
      return WPResponse(
        statusCode: res.statusCode,
        data: parsePages(res.data),
        meta: res.meta,
      );
    } catch (e) {
      rethrow;
    }
  }
}
