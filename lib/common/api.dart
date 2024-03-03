const String _baseUrl = "http://127.0.0.1:8000/api/v1/";

extension ApiUrl on String {
  String get apiBaseUrl => "$_baseUrl$this";
}
