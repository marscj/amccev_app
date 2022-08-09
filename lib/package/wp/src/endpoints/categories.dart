part of '../wp.dart';

class _Categories {
  static const String _name = 'categories';
  WordPressAPI _api;

  _Categories(this._api);

  /// [GET] categories from WP categories endpoint
  ///
  /// `/wp/v2/categories`
  Future<WPResponse> fetch({int? id, Map<String, dynamic>? args}) async {
    try {
      if (id != null) {
        final WPResponse res = await _api.fetch('$_name/$id', args: args);
        return WPResponse(
          statusCode: res.statusCode,
          data: Category.fromMap(res.data),
          meta: res.meta,
        );
      }
      final WPResponse res = await _api.fetch('$_name', args: args);
      return WPResponse(
        statusCode: res.statusCode,
        data: parseCategories(res.data),
        meta: res.meta,
      );
    } catch (e) {
      rethrow;
    }
  }
}
