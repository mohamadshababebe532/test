class RevenuessModel {
  String? date;
  String? description;
  String? agent_id;
  String? income;
  String? created_at;
  String? type_value;
  int? id;
  RevenuessModel(
      {this.id,
      this.agent_id,
      this.date,
      this.type_value,
      this.description,
      this.created_at,
      this.income});
  RevenuessModel.fromJson({required Map<String, dynamic> json}) {
    date = json['date'] ?? '';
    id = json['id'] ?? '';
    type_value = json['type_value'] ?? '';
    agent_id = json['agent_id'] ?? '';
    created_at = json['created_at'] ?? '';
    description = json['description'] ?? '';
    income = json['income'] ?? '';
  }
}
