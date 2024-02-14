class GetAccountingModel {
  String? date;
  String? type_value;
  int? id;
  String? description;
  String? expenses;
  String? income;

  GetAccountingModel(
      {this.id, this.date, this.description, this.expenses, this.type_value});
  GetAccountingModel.fromJson({required Map<String, dynamic> json}) {
    date = json['date'];
    id = json['id'];
    type_value = json['type_value'];
    description = json['description'];
    expenses = json['expenses'];
    income = json['income'];
  }
}

  //  "id": 5,
  //           "agent_id": null,
  //           "date": "2023-05-08",
  //           "type_value": "AED",
  //           "description": "hello",
  //           "expenses": "25000",
  //           "income": null,
  //           "created_at": "2023-07-15T14:30:38.000000Z",
  //           "updated_at": "2023-07-15T14:30:38.000000Z"
  //       // }