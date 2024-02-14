class BankModel {
  String? account;
  String? name;
  int? id;
  BankModel({this.account, this.id,this.name});
  BankModel.fromJson({required Map<String, dynamic> json}) {
    account = json['account'];
    id = json['id'];
    name=json['name'];
  }
}
