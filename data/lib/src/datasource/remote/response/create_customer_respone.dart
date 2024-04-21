part of swagger.api;

class CreateCustomerRespone {
  bool? needConfirmotp;
  // ignore: library_private_types_in_public_api
  _SystemOtp? systemOtp;
  String? globalId;
  CreateCustomerRespone.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    needConfirmotp = json['p_needconfirmotp'];
    systemOtp = _SystemOtp.fromJson(json['p_systemotp']);
    globalId = json['p_globalid'];
  }
}

class _SystemOtp {
  String? otpMethod;
  String? otpTarget;
  String? expTime;
  String? nextResendTime;

  _SystemOtp.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    otpMethod = json['p_otp_method'];
    otpTarget = json['p_otp_target'];
    expTime = json['p_exp_time'];
    nextResendTime = json['p_next_resend_time'];
  }
}
