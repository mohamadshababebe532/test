import 'getinvoice_model.dart';

class SearchModel {
  String? name;
  String? company_name;
  String? work_category;
  String? email;
  String? land_line;
  String? phone_number;
  String? website;
  String? type;
  String? location;
  String? country;
  List<Invoice>? invoice;
  SearchModel(
      {this.company_name,
      this.country,
      this.email,
      this.invoice,
      this.land_line,
      this.location,
      this.name,
      this.phone_number,
      this.type,
      this.website,
      this.work_category});
  SearchModel.fromJson({required Map<String, dynamic> json}) {
    company_name = json['company_name'] ?? '';
    country = json['country'] ?? '';
    email = json['email'] ?? '';

    land_line = json['land_line'] ?? '';
    location = json['location'] ?? '';
    name = json['name'] ?? '';
    phone_number = json['phone_number'] ?? '';
    type = json['type'] ?? '';
    website = json['website'] ?? '';
    work_category = json['work_category'] ?? '';
    invoice = (json['invoice'] as List<dynamic>).map((v) {
      return Invoice.fromJson(json: v);
    }).toList();
  }
}

class Invoice {
  int? tax;
  int? id;
  int? agent_id;
  int? total;
  String? note;
  int? subtotal;
  String? currency_type;
  String? type;
  String? date;
  String? duedate;
  List<OrderModel>? orders;
  Invoice(
      {this.agent_id,
      this.currency_type,
      this.date,
      this.duedate,
      this.id,
      this.note,
      this.orders,
      this.subtotal,
      this.tax,
      this.total,
      this.type});
  Invoice.fromJson({required Map<String, dynamic> json}) {
    tax = json['tax'];
    id = json['id'];
    agent_id = json['agent_id'];
    total = int.tryParse(json['total'].toString());
    note = json['note'];
    subtotal = json['subtotal'];
    currency_type = json['currency_type'];
    type = json['type'];
    date = json['date'];
    duedate = json['duedate'];
    orders = (json['orders'] as List<dynamic>).map((v) {
      return OrderModel.fromJson(json: v);
    }).toList();
  }
}
