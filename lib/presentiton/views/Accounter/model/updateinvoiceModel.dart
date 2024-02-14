import 'package:flutter/material.dart';

import 'addinvoice.dart';

class UpdateModel {
  String? agent_no;
  String? agent_id;
  String? tax;
  String? discount;
  String? total;
  String? invoice_no;
  String? paid;
  String? type;

  String? date;
  String? duedate;
  String? subtotal;
  String? currency_type;
  String? note;
  List<AddInvoiceModel>? order;
  UpdateModel(
      {this.agent_id,
      this.type,
      this.note,
      this.order,
      this.subtotal,
      this.date,
      this.duedate,
      this.currency_type,
      this.paid,
      this.agent_no,
      this.discount,
      this.invoice_no,
      this.tax,
      this.total});
}

class UpdateInvoiceModel {
  TextEditingController? namecontroller;
  TextEditingController? descontroller;

  TextEditingController? price;
  double quantitys;
  UpdateInvoiceModel(
      {this.quantitys = 0,
      this.price,
      this.descontroller,
      this.namecontroller});
}
