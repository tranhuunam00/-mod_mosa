class BaseResponse {
  final bool success;
  final dynamic message;
  Map<String, dynamic>? data;

  BaseResponse({required this.success, required this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
      success: json['success'], message: json['message'], data: json['data']);
}
