class ExpansessModel {
  String? date;
  int? id;
  String? description;
  String? created_at;
  String? type_value;
  String? expenses;
  String? agent_id;
  ExpansessModel(
      {this.agent_id,
      this.id,
      this.type_value,
      this.date,
      this.description,
      this.expenses,
      this.created_at});
  ExpansessModel.fromJson({required Map<String, dynamic> json}) {
    date = json['date'];
    type_value = json['type_value'];
    created_at = json['created_at'];
    agent_id = json['agent_id'];
    id = json['id'];
    description = json['description'];
    expenses = json['expenses'];
  }
}
