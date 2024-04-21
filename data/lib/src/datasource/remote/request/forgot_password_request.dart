part of swagger.api;

class ForgotPasswordRequest {
  String? mobile;

  ForgotPasswordRequest(this.mobile);
  Map<String, dynamic> toJson() {
    return {'p_mobile': mobile};
  }
}
