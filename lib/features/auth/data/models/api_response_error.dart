
import '../../domain/entities/api_response_error_entity.dart';

class ApiResponseErrorModel extends ApiResponseErrorEntity {
  ApiResponseErrorModel(
      {required super.code, required super.message, super.details});

  factory ApiResponseErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseErrorModel(
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['detail'] as Map<String, dynamic>?,
    );
  }
}
