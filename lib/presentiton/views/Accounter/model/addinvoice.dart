import 'package:flutter/material.dart';

 
class MohamadModel {
  String? agent_no;
  String? agent_id;
  String? tax;
  String? discount;
  String? total;
  String? invoice_no;
  String? paid;
  String? type;
  String? note;
  String? date;
  String? duedate;
  String? subtotal;
  String? currency_type;
  List<AddInvoiceModel>? order;
  MohamadModel(
      {this.agent_id,
      this.type,
      this.currency_type,
      this.note,
      this.date,
      this.duedate,
      this.order,
      this.paid,
      this.agent_no,
      this.discount,
      this.invoice_no,
      this.subtotal,
      this.tax,
      this.total});
}

class AddInvoiceModel {
  TextEditingController? namecontroller;
  TextEditingController? descontroller;
  int asd;
  TextEditingController? price;
  double quantitys;
  AddInvoiceModel(
      {this.quantitys = 0,
      this.price,
      this.asd = 0,
      this.descontroller,
      this.namecontroller});
}
