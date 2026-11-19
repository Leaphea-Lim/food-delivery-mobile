import '../constants/api_endpoints.dart';

/// Abstract REST API client interface.
/// Supports swappable implementations (e.g. Dio, http, or mock clients).
abstract class ApiClient {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String endpoint, {dynamic body, Map<String, dynamic>? queryParameters});
  Future<dynamic> put(String endpoint, {dynamic body, Map<String, dynamic>? queryParameters});
  Future<dynamic> delete(String endpoint, {Map<String, dynamic>? queryParameters});
}

/// Baseline API client ready for REST integration.
class AppApiClient implements ApiClient {
  final String baseUrl;
  String? _authToken;

  AppApiClient({this.baseUrl = ApiEndpoints.baseUrl});

  void setAuthToken(String token) {
    _authToken = token;
  }

  void clearAuthToken() {
    _authToken = null;
  }

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (_authToken != null) 'Authorization': 'Bearer $_authToken',
      };

  @override
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    // Scaffold ready for http/dio package binding
    throw UnimplementedError('API client integration pending backend configuration');
  }

  @override
  Future<dynamic> post(String endpoint, {dynamic body, Map<String, dynamic>? queryParameters}) async {
    throw UnimplementedError('API client integration pending backend configuration');
  }

  @override
  Future<dynamic> put(String endpoint, {dynamic body, Map<String, dynamic>? queryParameters}) async {
    throw UnimplementedError('API client integration pending backend configuration');
  }

  @override
  Future<dynamic> delete(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    throw UnimplementedError('API client integration pending backend configuration');
  }
}
