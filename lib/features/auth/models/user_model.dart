/// Model ពី Database (តារាង users) + Mock Data សម្រាប់ Static UI
class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatarUrl,
    this.authProvider = 'email', // email | google | phone
    this.isVerified = false,
  });

  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatarUrl;
  final String authProvider;
  final bool isVerified;
}

class MockData {
  MockData._();

  static const UserModel user = UserModel(
    id: 'u_001',
    name: 'Maya',
    email: 'maya@example.com',
    phone: '012345678',
    isVerified: true,
  );
}
