class ApiResponseErrorEntity {
  final String code;
  final String message;
  final Map<String, dynamic>? details;

  ApiResponseErrorEntity({
    required this.code,
    required this.message,
    this.details,
  });

}