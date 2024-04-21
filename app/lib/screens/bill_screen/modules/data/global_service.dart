final List<Map<String, dynamic>> services = [
  {
    'id': '0',
    'imagePath': 'assets/images/ic_electricity.png',
    'serviceName': 'Hóa đơn điện',
    'isSave': 0
  },
  {
    'id': '1',
    'imagePath': 'assets/images/ic_water.png',
    'serviceName': 'Hóa đơn nước',
    'isSave': 0
  },
  {
    'id': '2',
    'imagePath': 'assets/images/ic_postpaid_phone.png',
    'serviceName': 'Điện thoại trả sau',
    'isSave': 0
  },
  {
    'id': '3',
    'imagePath': 'assets/images/ic_internet.png',
    'serviceName': 'Hóa đơn Internet',
    'isSave': 0
  },
  {
    'id': '4',
    'imagePath': 'assets/images/ic_education.png',
    'serviceName': 'Học phí',
    'isSave': 0
  }
];

final List<String> suppliers = [
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành',
  'Đông Tiến Thành'
];

final List<Map<String, dynamic>> bill_list = [
  {
    'title': 'Điện lực EVN Hà Nội',
    'imagePath': 'assets/images/ic_water.png',
    'status': 'Chờ thanh toán',
    'IDcontract': 'PD0500031662',
    'userName': 'Nguyễn Văn A',
    'money': 394232
  },
  {
    'title': 'Điện lực EVN Hà Nội',
    'imagePath': 'assets/images/ic_education.png',
    'status': 'Chưa đến hạn',
    'IDcontract': 'PD0500031662',
    'userName': 'Nguyễn Văn A',
    'money': 0
  },
  {
    'title': 'Điện lực EVN Hà Nội',
    'imagePath': 'assets/images/ic_electricity.png',
    'status': 'Quá hạn 3 ngày',
    'IDcontract': 'PD0500031662',
    'userName': 'Nguyễn Văn A',
    'money': 394232
  },
  {
    'title': 'Điện lực EVN Hà Nội',
    'imagePath': 'assets/images/ic_water.png',
    'status': 'Chờ thanh toán',
    'IDcontract': 'PD0500031662',
    'userName': 'Nguyễn Văn A',
    'money': 394232
  },
  {
    'title': 'Điện lực EVN Hà Nội',
    'imagePath': 'assets/images/ic_water.png',
    'status': 'Chờ thanh toán',
    'IDcontract': 'PD0500031662',
    'userName': 'Nguyễn Văn A',
    'money': 394232
  },
];

class Bill {
  final String title;
  final String imagePath;
  final String status;
  final String IDcontract;
  final String userName;
  final double money;

  Bill({
    required this.title,
    required this.imagePath,
    required this.status,
    required this.IDcontract,
    required this.userName,
    required this.money,
  });
}
