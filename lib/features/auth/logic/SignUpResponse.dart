class SignUpResponse {
  final bool success;
  final String message;

  SignUpResponse({
    required this.success,
    required this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('details')) {
      return SignUpResponse(
        success: false,
        message: json['details'],
      );
    }

    return SignUpResponse(
      success: json['success'] ?? true,
      message: json['message'] ?? 'Registration successful',
    );
  }
}


class SignInModelRequest {
  final String email;
  final String password;

  SignInModelRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}