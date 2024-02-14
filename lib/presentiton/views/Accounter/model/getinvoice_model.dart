 
class GetInvoiceModel {
  int? id;
  int? agent_id;
  int? tax;
  String? Convertar;
  int? discount;
  double? total;
  String? note;
  String? currency_type;
  String? date;
  String? duedate;
  double? all_paid;
  double? subtotal;
  double? tax_rate;
  double? discount_rate;
  Agents? agent;

  List<PayedAmount>? bill_payments;
  List<OrderModel>? orders;
  GetInvoiceModel(
      {this.agent,
      this.all_paid,
      this.tax_rate,
      this.discount_rate,
      this.id,
      this.Convertar,
      this.subtotal,
      this.bill_payments,
      this.date,
      this.duedate,
      this.currency_type,
      this.agent_id,
      this.discount,
      this.note,
      this.orders,
      this.tax,
      this.total});
  GetInvoiceModel.fromJson({required Map<String, dynamic> json}) {
    Convertar = json['convertar'] ?? '';
    agent_id = json['agent_id'];
    all_paid = double.tryParse(json['all_paid'].toString()) ?? 0;
    id = json['id'];
    subtotal = double.tryParse(json['subtotal'].toString()) ?? 0;
    currency_type = json['currency_type'] ?? '';
    duedate = json['duedate'] ?? '';
    date = json['date'] ?? '';
    tax_rate = double.tryParse(json['tax_rate'].toString()) ?? 0;
    discount_rate = double.tryParse(json['discount_rate'].toString()) ?? 0;
    discount = json['discount'] ?? 0;
    total = double.tryParse(json['total'].toString()) ?? 0;
    tax = int.tryParse(json['tax'].toString()) ?? 0;
    note = json['note']==null||json['note']=='null' ? '':json['note'];
    agent =
        json['agent'] != null ? new Agents.fromJson(json: json['agent']) : null;
    orders = (json['orders'] as List<dynamic>).map((v) {
      return OrderModel.fromJson(json: v);
    }).toList();
    bill_payments = (json['bill_payments'] as List<dynamic>).map((v) {
      return PayedAmount.fromJosn(json: v);
    }).toList();
  }
}

class Agents {
  int? id;
  String? company_name;
  String? work_category;
  String? name;
  String? email;
  String? land_line;
  String? phone_number;
  String? type;
  String? website;
  String? location;
  String? country;

  Agents.fromJson({required Map<String, dynamic> json}) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    work_category = json['work_category'] ?? '';
    land_line = json['land_line'] ?? '';
    website = json['website'] ?? '';
    location = json['location'] ?? '';
    country = json['country'] ?? '';
    company_name = json['company_name'] ?? '';
    phone_number = json['phone_number'] ?? '';
    email = json['email'] ?? '';
    type = json['type'] ?? '';
  }
}

class OrderModel {
  String? order;
  String? description;
  double? quantity;
  int? price;
  int? final_invoice;
  OrderModel(
      {this.description,
      this.final_invoice,
      this.order,
      this.price,
      this.quantity});
  OrderModel.fromJson({required Map<String, dynamic> json}) {
    order = json['order'] ?? '';
    description = json['description'] ?? '';
    quantity = double.tryParse(json['quantity'].toString()) ?? 0;
    price = int.tryParse(json['price'].toString()) ?? 0;
    final_invoice = int.tryParse(json['final_invoice'].toString());
  }

  //               "order": "bxbxbcbc",
  //               "description": "zggzvzvzzg",
  //               "quantity": 4,
  //               "price": 2580,
  //               "final_invoice": 85,
}

class PayedAmount {
  String? value_type;
  int? id;
  String? paid;
  PayedAmount({this.paid, this.value_type, this.id});
  PayedAmount.fromJosn({required Map<String, dynamic> json}) {
    value_type = json['value_type'] ?? '';
    id = json['id'];
    paid = json['paid'];
  }
}
