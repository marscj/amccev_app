class RestPassword {
  int? status;
  String? message;

  RestPassword({this.status, this.message});

  RestPassword.fromJson(Map<String, dynamic> data)
      : status = data['data']['status'],
        message = data['message'];
}
