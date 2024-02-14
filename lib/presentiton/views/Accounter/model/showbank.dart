class ShowBankModel {
  String? account;
  int? id;
  ShowBankModel({this.account, this.id});
  ShowBankModel.fromJosn({required Map<String, dynamic> json}) {
    account = json['account'];
    id = json['id'];
  }
}
