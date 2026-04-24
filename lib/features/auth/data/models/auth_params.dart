class AuthParams {
  final String email;
  final String password;
  final String? name;

  AuthParams({required this.email, required this.password, this.name});
}
