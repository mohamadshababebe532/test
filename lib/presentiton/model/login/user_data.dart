class UserData{
  int? id;

  String? firstName;

  String? lastName;

  String? email;

  String?  role;

  String? phoneNumber;

  String? startedDay;

  String? token;

  UserData({this.id, this.firstName, this.lastName, this.email, this.role, this.phoneNumber, this.startedDay, this.token});

  UserData.fromMap(Map<String, dynamic> json){
    id = json['id'];

    firstName = json['first_name'];

    lastName = json['last_name'];

    email = json['email'];

    role = json['role'];

    phoneNumber = json['phone_number'];

    startedDay = json['start_day'];

    token = json['token'];
  }
}