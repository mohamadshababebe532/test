import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../model/addagent_model.dart';
import '../model/addinvoice.dart';
import '../model/banck_model.dart';
import '../model/expansess_model.dart';
import '../model/getinvoice_model.dart';
import '../model/revenuess_model.dart';
import '../model/showbank.dart';
import '../model/updateinvoiceModel.dart';
part 'accounter_state.dart';

class AccounterCubit extends Cubit<AccounterState> {
  AccounterCubit() : super(AccounterInitial());
  int index = 0;
  void indexItem(int index_item) {
    index = index_item;
    print(index);
    emit(ChangeBodyScreen());
  }

// senzascent.test-holooltech.com
  void addexpenses({required ExpansessModel expansessModel}) async {
    emit(AddExpansessLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/create-accounting'),
        headers: {
          'Accept': '*/*',
        },
        body: {
          'date': expansessModel.date,
          'type_value': expansessModel.type_value,
          'description': expansessModel.description,
          'expenses': expansessModel.expenses,
        });
    try {
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        emit(AddExpansessSucState());
      } else {
        emit(AddExpansessFaliedState());
      }
    } catch (e) {
      emit(AddExpansessFaliedState());
      throw Exception(e.toString());
    }
  }

  void updaterevenus({required RevenuessModel revenuessModel}) async {
    emit(UpdateRevenusLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/edit-accounting/${revenuessModel.id.toString()}'),
        headers: {
          'Accept': '*/*',
        },
        body: {
          'date': revenuessModel.date,
          'type_value': revenuessModel.type_value,
          'description': revenuessModel.description,
          'income': revenuessModel.income,
        });
    var responseData = await jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      emit(UpdateRevenusSucState());
    } else {
      emit(UpdateRevenusFaliedState());
    }
  }

  void updateexpansess({required ExpansessModel expansessModel}) async {
    emit(UpdateExpansessLoaidingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/edit-accounting/${expansessModel.id.toString()}'),
        headers: {
          'Accept': '*/*',
        },
        body: {
          'date': expansessModel.date,
          'type_value': expansessModel.type_value,
          'description': expansessModel.description,
          'expenses': expansessModel.expenses,
        });
    var responseData = await jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      emit(UpdateExpansessSucState());
    } else {
      emit(UpdateExpansessFaieldState());
    }
  }

  void addrevenues({required RevenuessModel revenuessModel}) async {
    emit(AddRecevuesLoadingStaete());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/create-accounting'),
        headers: {
          'Accept': '*/*',
        },
        body: {
          'type_value': revenuessModel.type_value,
          'date': revenuessModel.date,
          'description': revenuessModel.description,
          'income': revenuessModel.income
        });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      emit(AddRecevuesSecState());
    } else {
      emit(AddResourceFailedState());
    }
  }

  List<RevenuessModel> revenuessModel = [];
  int? total_income;
  int? total_income_syria;
  void getresource() async {
    emit(getExpansessLoadingState());
    revenuessModel.clear();
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-income'),
      headers: {
        'Accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        total_income_syria = responseData['total_income_syria'];
        total_income = responseData['total_income'];
        print(total_income);
        for (var item in responseData['accounting']) {
          revenuessModel.add(RevenuessModel.fromJson(json: item));
        }
        emit(getExpansessSucState());
      } else {
        emit(getExpansessFailedState());
      }
    } else {
      getresource();
    }
  }

  // int? total_income_dubai;
  // void getresource2() async {
  //   emit(getExpansessLoadingState());
  //   revenuessModel.clear();
  //   Response response = await http.get(
  //     Uri.parse(
  //         'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-income'),
  //     headers: {
  //       'Accept': '*/*',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     if (responseData['status'] == true) {
  //       total_income = responseData['total_income'];
  //       total_income_dubai = responseData['total_income_dubai'];
  //       print(total_income_dubai);
  //       for (var item in responseData['accounting']) {
  //         revenuessModel.add(RevenuessModel.fromJson(json: item));
  //       }
  //       emit(getExpansessSucState());
  //     } else {
  //       emit(getExpansessFailedState());
  //     }
  //   } else {
  //     getresource();
  //   }
  // }

  void deleterevenuse({required String id}) async {
    emit(DeletedLoadingState());
    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/delete-accounting/${id.toString()}'),
        headers: {
          'Accept': '*/*',
        });
    var resposeData = jsonDecode(response.body);
    print(resposeData);
    if (resposeData['status'] == true) {
      emit(DeletedSucsyfllytState());
      getresource();
      getallexpansess();
    } else if (resposeData['status'] == false) {
      emit(DeletedFaliedState());
    }
  }

  List<ExpansessModel> expansessModel = [];

  int? total_expenses;
  int? total_expenses_syria;
  void getallexpansess() async {
    emit(GetAllIncomeLoadingState());
    expansessModel.clear();
    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-expenses'),
        headers: {
          'Accept': '*/*',
        });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      total_expenses_syria = responseData['total_expenses_syria'];
      total_expenses = responseData['total_expenses'];
      for (var item in responseData['accounting']) {
        expansessModel.add(ExpansessModel.fromJson(json: item));
      }
      emit(GetAllIncomeSucState());
    } else {
      emit(GetAllIncomeFailedState());
    }
  }

  int? total_expenses_dubai;
  void getallexpansess2() async {
    emit(GetAllIncomeLoadingState());
    expansessModel.clear();

    Response response = await http.get(
        Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-expenses',
        ),
        headers: {
          'Accept': '*/*',
        });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      total_expenses_dubai = responseData['total_expenses_dubai'];
      total_expenses = responseData['total_expenses'];
      for (var item in responseData['accounting']) {
        expansessModel.add(ExpansessModel.fromJson(json: item));
      }
      emit(GetAllIncomeSucState());
    } else {
      emit(GetAllIncomeFailedState());
    }
  }

  void addagient({required AddAgentModel addAgentModel}) async {
    emit(AddAgentsLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/create-agents'),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'company_name': addAgentModel.company_name,
        'name': addAgentModel.name,
        'email': addAgentModel.email,
        'country': addAgentModel.country,
        'land_line': addAgentModel.land_line,
        'phone_number': addAgentModel.phone_number,
        'type': addAgentModel.type,
        'location': addAgentModel.location,
        'website': addAgentModel.website,
        'work_category': addAgentModel.work_category,
      },
    );
    try {
      var responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        emit(AddAgentsSucState());
      } else if (responseData['message'] == 'The given data was invalid.') {
        print(responseData);
        emit(AddAgentsFailedState(message: responseData['message']));
      }
    } catch (e) {
      throw Exception(
          Fluttertoast.showToast(msg: 'Please Cheack Your Internet'));
    }
  }

  List<AddAgentModel> addAgentModel = [];
  Future<void> getagent() async {
    addAgentModel.clear();
    emit(GetAllAgentsLoadingState());
    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-agents'),
        headers: {
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData['status'] == true) {
        for (var item in responseData['accounting']) {
          addAgentModel.add(AddAgentModel.fromJson(json: item));
        }
        emit(GetAllAgentsSucState());
      } else {
        emit(GetAllIncomeFailedState());
      }
    } else {
      getagent();
    }
  }

  void deleteagents({required String id}) async {
    emit(DeleteAgeintsLoadingState());
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/delete-agents/${id.toString()}'),
      headers: {
        'Accept': '*/*',
      },
    );
    var responseData = await jsonDecode(response.body);
    if (responseData['status'] == true) {
      emit(DeleteAgeintsSucState());
      getagent();
    } else {
      emit(DeleteAgeintsFiledState());
    }
  }

  Future<void> updateagents({required AddAgentModel addAgentModel}) async {
    emit(UpdateAgentsLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/edit-agents/${addAgentModel.id.toString()}'),
        headers: {
          'Accept': '*/*',
        },
        body: {
          'name': addAgentModel.name ?? '',
          'company_name': addAgentModel.company_name ?? '',
          'email': addAgentModel.email ?? '',
          'country': addAgentModel.country ?? '',
          'land_line': addAgentModel.land_line ?? '',
          'phone_number': addAgentModel.phone_number ?? '',
          'type': addAgentModel.type ?? '',
          'location': addAgentModel.location ?? '',
          'id': addAgentModel.id.toString(),
          'website': addAgentModel.website ?? '',
          'work_category': addAgentModel.work_category ?? '',
        });

    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      emit(UpdateAgentsSucState());
    } else {
      emit(UpdateAgentsFaliedState());
    }
  }

  List<AddInvoiceModel> addinvoicemodel = [];
  void addform({required AddInvoiceModel addInvoiceModel}) {
    addinvoicemodel.add(addInvoiceModel);
    emit(AddFormState());
  }

  void removeform({required AddInvoiceModel addInvoiceModel}) {
    addinvoicemodel.remove(addInvoiceModel);
    emit(removeFormState());
  }

  void addquantitys({required double quantitys, required int index}) {
    addinvoicemodel[index].quantitys++;
    emit(AddQuantitysForm());
  }

  void removequantity({required double quantitys, required int index}) {
    addinvoicemodel[index].quantitys--;
    emit(RemoveQuantityForm());
  }

  ///////////////////////////////////////update function
  List<UpdateInvoiceModel> updateinvoice = [];
  void Updateform({required UpdateInvoiceModel updateInvoiceModel}) {
    updateinvoice.add(updateInvoiceModel);
  }

  void updateremoveform({required UpdateInvoiceModel updateInvoiceModel}) {
    updateinvoice.remove(updateInvoiceModel);
  }

  void updateaddquantitys({required double quantitys, required int index}) {
    updateinvoice[index].quantitys++;
  }

  void updateremovequantity({required double quantitys, required int index}) {
    updateinvoice[index].quantitys--;
  }

  double totalUpdate = 0;
  double endtotalUpdate = 0;
  TextEditingController taxUpdate = TextEditingController();
  TextEditingController discountUpdate = TextEditingController();
  TextEditingController paidUpdate = TextEditingController();
  double taxsubtotalUpdate = 0;
  double discountsubtotalUpdate = 0;
  void calculateTotalUpdate() {
    totalUpdate = 0;
    endtotalUpdate = 0;
    discountsubtotalUpdate = 0;
    taxsubtotalUpdate = 0;
    for (var invoice in updateinvoice) {
      double quantity = invoice.quantitys.toDouble();
      double price = double.tryParse(invoice.price!.text) ?? 0;
      double taxe = double.tryParse(taxUpdate.text) ?? 0;
      double discounte = double.tryParse(discountUpdate.text) ?? 0;
      double paied = double.tryParse(paidUpdate.text) ?? 0;
      double subtotal = quantity * price;

      double totalWithTax = (subtotal * taxe / 100);
      double totalwithdiscount = (subtotal * discounte / 100);
      totalUpdate += subtotal + totalWithTax - totalwithdiscount - paied;
      endtotalUpdate += subtotal;
      discountsubtotalUpdate = (endtotalUpdate * discounte / 100);
      taxsubtotalUpdate = (endtotalUpdate * taxe / 100);
      emit(calculateupdatasucstate());
    }
    double paied = double.tryParse(paid.text) ?? 0;
    totalUpdate = totalUpdate - paied;
    emit(calculateupdatasucstate());
  }

  double total = 0;
  double endtotal = 0;
  TextEditingController tax = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController paid = TextEditingController();
  double taxsubtotal = 0;
  double discountsubtotal = 0;
  void calculateTotal() {
    total = 0;
    endtotal = 0;
    taxsubtotal = 0;
    discountsubtotal = 0;
    for (var invoice in addinvoicemodel) {
      double quantity = invoice.quantitys.toDouble();
      double price = double.tryParse(invoice.price!.text) ?? 0;
      double taxe = double.tryParse(tax.text) ?? 0;
      double discounte = double.tryParse(discount.text) ?? 0;
      double subtotal = quantity * price;
      double totalWithTax = (subtotal * taxe / 100);
      double totalwithdiscount = (subtotal * discounte / 100);
      total += subtotal + totalWithTax - totalwithdiscount;

      endtotal += quantity * price;
      taxsubtotal = (endtotal * taxe / 100);
      discountsubtotal = (endtotal * discounte / 100);
      emit(CalucalateTotalState());
    }
    double paied = double.tryParse(paid.text) ?? 0;

    total = total - paied;
    emit(CalucalateTotalState());
  }

  void resetForm() {
    addinvoicemodel.clear();
    discount.clear();
    tax.clear();
    paid.clear();
    total = 0.0;
    emit(resetFormState());
  }

  List<GetInvoiceModel> getinvoiceModel = [];
  Future<void> getinvoice() async {
    getinvoiceModel.clear();
    emit(GetInvoiceLoadingState());

    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-invoices'),
        headers: {
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData['status'] == true) {
        for (var item in responseData['invoices']) {
          getinvoiceModel.add(GetInvoiceModel.fromJson(json: item));
        }
        emit(getInvoiceSucState());
      } else {
        emit(GetInvoiceFaliedState());
      }
    } else {
      getinvoice();
    }
  }

  void deleteinvoce({required int id}) async {
    emit(DeleteInvoiceLoadingState());
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/delete-invoice/${id.toString()}'),
      headers: {
        'Accept': '*/*',
      },
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      print(responseData);
      emit(DeleteInvoiceSucState());
      getinvoice();
    } else {
      emit(DeleteInvoiceFaliedState());
    }
  }
//   List<Currency>currency=[];
// getCarrency()async{
//   currency.clear();
//   emit(CurrencyLoadingState());
// var response= await http.get(Uri.parse('http://senzascent.test-holooltech.com/api/admin/currencies/get-all-currencies'),
// headers: {
//   'Accept':'*/*'
// },
// );
// var responseData=jsonDecode(response.body);
// print(responseData);
// if(responseData['status']==true){
//   for(var item in responseData['currencies']){
//     currency.add(Currency.fromJson(json: item));
//   }
//   emit(CurrencySucState());
// }else{
//   emit(CurrencyFaluerState());
// }
// }
// void addPaymentType(AddCurrencies addCurrencies)async{
// emit(AddCurrencyLoadingState());

// var response= await http.post(Uri.parse('http://senzascent.test-holooltech.com/api/admin/currencies/create-currency',),
// headers: {
//   'Accept':'*/*'
// },
// body: addCurrencies.toJson()
// );

// var responseData=jsonDecode(response.body);
// print(responseData);
// if(responseData['status']==true){
//  await getCarrency();
// emit(AddCurrencySucState());

// }
// else{
//   emit(AddCurrencyFaluerState());
// }

// }

  void urllancher({required String id}) async {
    emit(AddUrlLancherLoadingState());
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/export-invoice-pdf/${id.toString()}'),
      headers: {
        'Accept': '*/*',
      },
    );

    !await launchUrl(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/export-invoice-pdf/${id.toString()}'),
        mode: LaunchMode.externalApplication);
    emit(AddUrlLancherSucState());
  }

  void urlincome(
      {required String nameUrlExcel,
      required String dateUrlExcel,
      required String DueDateUrlExcel}) async {
    emit(AddUrlLancherIncomeLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/export-accounting-excel'),
        headers: {
          'Accept': '*/*',
        },
        body: {
          'name': nameUrlExcel.toString(),
          'start_date': dateUrlExcel.toString(),
          'end_date': DueDateUrlExcel.toString(),
        });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      print('asdasdasdasd');
      print(responseData['excel_link']);
      final Uri url = Uri.parse(responseData['excel_link']);
      !await launchUrl(url, mode: LaunchMode.externalApplication);
      emit(AddUrlLancherIncomeSucState());
    } else {
      emit(AddUrlLancherIncomeFailedState());
    }
  }

  void urlQatarapdfincome(
      {required String syria,
      required String date,
      required String duedate}) async {
    emit(AddUrlLancherPdfSyriaLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/export-accounting-qatar-pdf'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'name': syria,
          'start_date': date.toString(),
          'end_date': duedate.toString(),
        });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      print('asdasdasdasd');
      print(responseData['link_pdf']);
      final Uri url = Uri.parse(responseData['link_pdf']);
      !await launchUrl(url, mode: LaunchMode.externalApplication);
      emit(AddUrlLancherPdfSyriaSucState());
    } else {
      emit(AddUrlLancherPdfSyriaFiledState());
    }
  }

  void urlsyriapdfincome(
      {required String syria,
      required String date,
      required String duedate}) async {
    emit(AddUrlLancherPdfSyriaLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/export-accounting-syria-pdf'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'name': syria,
          'start_date': date.toString(),
          'end_date': duedate.toString(),
        });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      print('asdasdasdasd');
      print(responseData['link_pdf']);
      final Uri url = Uri.parse(responseData['link_pdf']);
      !await launchUrl(url, mode: LaunchMode.externalApplication);
      emit(AddUrlLancherPdfSyriaSucState());
    } else {
      emit(AddUrlLancherPdfSyriaFiledState());
    }
  }

  void urlQatarpdfincome(
      {required String dubai,
      required String date,
      required String duedate}) async {
    emit(AddUrlLancherPdfDubiaLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/export-accounting-qatar-pdf'),
      headers: {
        'Accept': '*/*',
      },
      body: {
        'name': dubai,
        'start_date': date.toString(),
        'end_date': duedate.toString(),
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      final Uri url = Uri.parse(responseData['link_pdf']);
      !await launchUrl(url, mode: LaunchMode.externalApplication);
      emit(AddUrlLancherPdfDubiaSucState());
    } else {
      emit(AddUrlLancherPdfDubiaFailedState());
    }
  }

  void urldubaipdfincome(
      {required String dubai,
      required String date,
      required String duedate}) async {
    emit(AddUrlLancherPdfDubiaLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/export-accounting-dubai-pdf'),
      headers: {
        'Accept': '*/*',
      },
      body: {
        'name': dubai,
        'start_date': date.toString(),
        'end_date': duedate.toString(),
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      final Uri url = Uri.parse(responseData['link_pdf']);
      !await launchUrl(url, mode: LaunchMode.externalApplication);
      emit(AddUrlLancherPdfDubiaSucState());
    } else {
      emit(AddUrlLancherPdfDubiaFailedState());
    }
  }

  List<GetInvoiceModel> getQuationModel = [];
  Future<void> getquatition() async {
    getQuationModel.clear();
    emit(GetQuatitionLoadingState());
    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-qoutation'),
        headers: {
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData['status'] == true) {
        for (var item in responseData['invoices']) {
          getQuationModel.add(GetInvoiceModel.fromJson(json: item));
        }
        emit(GetQuatitionSucStateState());
      } else {
        emit(GetQuatitionFaliedState());
      }
    } else {
      getquatition();
    }
  }

  void addPayment({
    required String id,
    required String paid,
  }) async {
    emit(AddPaymentsLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/add-paid/${id}'),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'paid': paid,
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['success'] == true) {
      emit(AddPaymentSucState());
    } else if (responseData['status'] == 'false') {
      emit(AddPaymentsFaieldSate(message: responseData['msg']));
    } else {
      emit(AddPaymentsFaieldSate(message: responseData['msg']));
    }
  }

  // void searchinvoice({required String search, required String filter}) async {
  //   emit(SearchInvoiceLoadingState());
  //   Response response = await http.post(
  //       Uri.parse(
  //           'http://senzascent.test-holooltech.com/api/admin/accounting/search'),
  //       headers: {
  //         'Accept': 'application/json',
  //       },
  //       body: {
  //         'search': search,
  //         'filter': filter,
  //       });
  //   var responseData = jsonDecode(response.body);
  //   print(responseData);
  //   if (responseData['status'] == true) {
  //     getinvoiceModel.clear();
  //     for (var item in responseData['result_search']) {
  //       getinvoiceModel.add(GetInvoiceModel.fromJson(json: item));
  //     }
  //     emit(SearchInvoiceSucState());
  //   } else if (getinvoiceModel.isEmpty) {
  //     Fluttertoast.showToast(msg: 'NoData');
  //   } else {
  //     emit(SearchInvoiceFaieldState());
  //   }
  // }
  void filterItemsInv(String query) async {
    emit(SearchQLoadingState());
    List<GetInvoiceModel> result = [];
    if (query.isEmpty) {
      result = getinvoiceModel;
    } else {
      result = getinvoiceModel
          .where((item) =>
              item.date!.toLowerCase().contains(query.toLowerCase()) ||
              item.total!
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.agent!.name!.toLowerCase().contains(query.toLowerCase()) ||
              item.agent!.company_name
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.id.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();

      // result=getQuationModel.where((item) =>
      // item.total.toLowerCase().contains(query.toLowerCase()).toList();
      //       // item..toLowerCase().contains(query.toLowerCase()) ||
      //       // item.domain_name.toString().contains(query))
    }
    if (result.isEmpty) {
      await getinvoice();
      ;
      Fluttertoast.showToast(
          msg: 'The item does not exist', backgroundColor: Colors.red);
      emit(SearchInvoiceSucState());
    } else {
      getinvoiceModel = result;
      emit(SearchInvoiceSucState());
    }
  }

  void filterinvocce({required String type}) async {
    emit(GetFilterLoadingState());
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-invoices?${type.toString()}'),
      headers: {
        'Accept': 'application/json',
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      getinvoiceModel.clear();
      for (var item in responseData['invoices']) {
        getinvoiceModel.add(GetInvoiceModel.fromJson(json: item));
      }
      emit(GetFilterSucState());
      ;
    } else if (getinvoiceModel.isEmpty) {
      Fluttertoast.showToast(msg: 'NoData');
    } else {
      emit(GetFilterFailedState());
    }
  }

  void filterQutation({required String type}) async {
    emit(GetFilterQLoadingState());
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/get-all-qoutation?${type.toString()}'),
      headers: {
        'Accept': 'application/json',
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      getQuationModel.clear();
      for (var item in responseData['invoices']) {
        getQuationModel.add(GetInvoiceModel.fromJson(json: item));
      }
      emit(GetFilterQSucState());
      ;
    } else if (getinvoiceModel.isEmpty) {
      Fluttertoast.showToast(msg: 'NoData');
    } else {
      emit(GetFilterQfalidState());
    }
  }

  // void searchqoutaion({
  //   required String search,
  //   required String filter,
  // }) async {
  //   emit(SearchQLoadingState());
  //   Response response = await http.post(
  //       Uri.parse(
  //           'http://senzascent.test-holooltech.com/api/admin/accounting/search'),
  //       headers: {
  //         'Accept': 'application/json',
  //       },
  //       body: {
  //         'search': search,
  //         'filter': filter,
  //       });
  //   var responseData = jsonDecode(response.body);
  //   if (responseData['status'] == true) {
  //     getQuationModel.clear();
  //     for (var item in responseData['result_search']) {
  //       getQuationModel.add(GetInvoiceModel.fromJson(json: item));
  //     }
  //     print(getQuationModel);
  //     emit(SearchQSucState());
  //   } else {
  //     emit(SearchQFailedState());
  //   }
  // }
  void filterItems(String query) async {
    emit(SearchQLoadingState());
    List<GetInvoiceModel> result = [];
    if (query.isEmpty) {
      result = getQuationModel;
    } else {
      result = getQuationModel
          .where((item) =>
              item.date!.toLowerCase().contains(query.toLowerCase()) ||
              item.total!
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.agent!.name!.toLowerCase().contains(query.toLowerCase()) ||
              item.agent!.company_name
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.id.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();

      // result=getQuationModel.where((item) =>
      // item.total.toLowerCase().contains(query.toLowerCase()).toList();
      //       // item..toLowerCase().contains(query.toLowerCase()) ||
      //       // item.domain_name.toString().contains(query))
    }
    if (result.isEmpty) {
      await getquatition();
      Fluttertoast.showToast(
          msg: 'The item does not exist', backgroundColor: Colors.red);
      emit(SearchQSucState());
    } else {
      getQuationModel = result;
      emit(SearchQSucState());
    }
  }

  void searchincome({required String search, required String filter}) async {
    emit(SearchIncomeLoading());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/search-in-income'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'search': search,
          'filter': filter,
        });

    var responseData = jsonDecode(response.body);
    if (responseData['message'] == 'Empty Data') {
      emit(SearcIncomeFaieldState());
    }
    if (responseData['status'] == true) {
      total_income = responseData['total_income'];
      revenuessModel.clear();
      for (var item in responseData['search']) {
        revenuessModel.add(RevenuessModel.fromJson(json: item));
      }
      emit(SearchIncomeSucState());
    } else if (revenuessModel.isEmpty) {
      emit(searchempty());
    } else {
      emit(SearcIncomeFaieldState());
    }
  }

  void searchexpansess({required String search, required String filter}) async {
    emit(SearchIExpansessLoading());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/search-in-expenses'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'search': search,
          'filter': filter,
        });

    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['message'] == 'Empty Data') {
      emit(SearchExpansessFaliedState());
    }
    if (responseData['status'] == true) {
      expansessModel.clear();
      total_expenses = responseData['total_expenses'];
      for (var item in responseData['search']) {
        expansessModel.add(ExpansessModel.fromJson(json: item));
      }
      emit(SearchExpansessSucState());
    } else if (expansessModel.isEmpty) {
      emit(searchempty());
    } else {
      emit(SearchExpansessFaliedState());
    }
  }

  void searchAgents({required String search, required String filter}) async {
    emit(SearchAgentsLoadingState());
    Response response = await http.post(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/accounting/search-in-agents'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'search': search,
          'filter': filter,
        });

    var responseData = jsonDecode(response.body);

    if (responseData['message'] == 'Empty Data') {
      emit(SearchAgentsFaliedState());
    }
    if (responseData['status'] == true) {
      addAgentModel.clear();
      for (var item in responseData['search']) {
        addAgentModel.add(AddAgentModel.fromJson(json: item));
      }
      emit(SearchAgentsSucState());
    } else if (addAgentModel.isEmpty) {
      emit(searchempty());
    } else {
      emit(SearchAgentsFaliedState());
    }
  }

  void deletepaied({required String id}) async {
    emit(DeletedPaiedLoadingState());

    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/delete-paid/${id}'),
      headers: {
        'Accept': '*/*',
      },
    );
    var responseData = jsonDecode(response.body);
    // print(response.statusCode);
    print(responseData);
    if (responseData['status'] == true) {
      emit(DeletedPaidSucState());
      getinvoice();
    } else if (responseData['status'] == false) {
      emit(DeletedFaliedState());
    } else {
      emit(DeletedFaliedState());
    }
  }

  bool cheacks = false;
  void boolvalue() {
    cheacks != cheacks;
    emit(CheacksState());
  }

  List<BankModel> bankModel = [];
  void getBank() async {
    bankModel.clear();
    emit(GetBankLoadingState());
    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/hosting/get-all-bank-accounts'),
        headers: {
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData['status'] == true) {
        for (var item in responseData['data']) {
          bankModel.add(BankModel.fromJson(json: item));
        }
        print(responseData);
        emit(GetBankSucState());
      } else if (response.statusCode == 500) {
        emit(GetBankFaieldState());
      }
    } else {
      getBank();
    }
  }

  void addBank({required BankModel bankModel}) async {
    emit(AddBankLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/hosting/create-bank-account'),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'account': bankModel.account,
        'name': bankModel.name,
      },
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      emit(AddBankSucState());
    } else if (responseData['message'] == 'The given data was invalid.') {
      emit(AddBankFaieldState());
    } else {
      Fluttertoast.showToast(msg: 'Check your Internet');
    }
  }

  void deleteBank({required String id}) async {
    emit(DelteBankLoadingState());
    Response response = await http.get(
        Uri.parse(
            'http://senzascent.test-holooltech.com/api/admin/hosting/delete-bank-account/${id.toString()}'),
        headers: {
          'Accept': '*/*',
        });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      emit(DeleteBankSucState());
      getBank();
    } else if (responseData['message'] == 'Not Found This Account !') {
      emit(DeleteBankFaliedState());
    }
  }

  void updateBank({required BankModel bankModel}) async {
    emit(UpdateBankLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/hosting/update-bank-account'),
      headers: {'Accept': 'application/json'},
      body: {
        'id': bankModel.id.toString(),
        'name': bankModel.name,
        'account': bankModel.account,
      },
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      emit(UpdateBankSucState());
    } else if (responseData['message'] == 'The given data was invalid.') {
      emit(UpdateBankFlaiedState());
    }
  }

  String convert = "";
  void newDueDate(String newdate) {
    convert = newdate;
    emit(ChangeDueDate());
  }

  ShowBankModel? showBankModel;
  String? account;

  Future<void> showbank({required String id}) async {
    emit(GetNoteLoadingState());
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/hosting/show-bank-account/${id.toString()}'),
      headers: {
        'Accept': '*/*',
      },
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      account = responseData['data']['account'];
      emit(GetNoteSucState());
      print(responseData);
    } else if (response.statusCode == 404) {
      emit(GetNoteFaeildState());
    } else {
      emit(GetNoteFaeildState());
    }
  }

  TextEditingController qua = TextEditingController();
  void changequantity(double quan) {
    quan = double.parse(qua.text);
    emit(GetQuaLoadingState());
  }

  void getData() async {
    Response response = await http.get(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/gt-users/info-user/33'),
      headers: {
        'Accept': 'Application/json',
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData['starting_date']);
    print(responseData);
  }

  void GenerateToInvoice({
    String? dueDate,
    String? id,
  }) async {
    emit(GenerateToInvoiceLoadingState());
    Response response = await http.post(
      Uri.parse(
          'http://senzascent.test-holooltech.com/api/admin/accounting/convert-qoutation-to-invoice'),
      headers: {
        'Accept': 'Application/json',
      },
      body: {
        'due_date': dueDate,
        'id': id,
      },
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    if (responseData['status'] == true) {
      emit(GenerateToInvoiceSucState());
    } else if (responseData['status'] == false) {
      emit(GenerateToInvoiceFaluerState());
    }
  }
  // List<String>Curancy=[];
  // void getAllCurancy()async{
  //   Response response=await http.get(Uri.parse('http://senzascent.test-holooltech.com/api/admin/currencies/get-all-currencies'),
  //   headers: {
  //     'Accept':'application/json',
  //   },
  //   );
  //   if(response.statusCode==200){
  //     var responseData=jsonDecode(response.body);
  //   if(responseData['status']==true){
  //     for(var item in responseData['currencies']){
  //       Curancy.add()
  //     }
  //   }
  //   }else{
  //     getAllCurancy();
  //   }
  // }
}

class ResponseModel<T> {
  T? data;
  bool _hasError = true;
  String message;

  bool get hasError => _hasError;

  ResponseModel.complete({
    required this.data,
    this.message = '',
  }) {
    _hasError = false;
  }

  ResponseModel.withError({
    required this.message,
    this.data,
  });
}
