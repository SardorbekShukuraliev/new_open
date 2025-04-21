import 'api_response_error_entity.dart';

class ApiResponse<T> {
  final bool success;
  final T? data;
  final ApiResponseErrorEntity? error;

  ApiResponse({
    required this.success,
    this.data,
    this.error,
  });
}
