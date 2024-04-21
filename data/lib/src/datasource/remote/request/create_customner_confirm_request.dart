part of swagger.api;

class CreateCustomerConfirm {
  String? useName;
  String? passWord;
  String? fullName;

  CreateCustomerConfirm({this.fullName, this.passWord, this.useName});
  Map<String, dynamic> toJson() {
    return {
      'p_username': useName,
      'p_password': passWord,
      'p_fullname': fullName,
    };
  }
}
