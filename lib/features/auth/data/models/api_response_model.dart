import 'package:kursol/features/auth/data/models/api_response_error.dart';
import 'package:kursol/features/auth/data/models/user_model.dart';
import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';

class ApiResponseModel extends ApiResponse {
  ApiResponseModel({required super.success, super.data, super.error});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      success: json["success"] as bool,
      data: UserModel.fromJson(json['data']),
      error: ApiResponseErrorModel.fromJson(json["error"]),
    );
  }
}
