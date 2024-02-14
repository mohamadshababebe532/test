part of 'accounter_cubit.dart';

@immutable
abstract class AccounterState {}

class AccounterInitial extends AccounterState {}

class AddCustomerSucState extends AccounterState {}

class AddCustomerFailedState extends AccounterState {}

class AddCustomerLoadingState extends AccounterState {}

class AddResourceSucState extends AccounterState {}

class AddResourceFailedState extends AccounterState {}

class AddResourceLoadingState extends AccounterState {}

///////////////////////
class AddExpansessSucState extends AccounterState {}

class AddExpansessFaliedState extends AccounterState {}

class AddExpansessLoadingState extends AccounterState {}

///////////////////
class AddRecevuesSecState extends AccounterState {}

class AddRecevuesFaieldState extends AccounterState {}

class AddRecevuesLoadingStaete extends AccounterState {}

class getExpansessSucState extends AccounterState {}

class getExpansessFailedState extends AccounterState {}

class getExpansessLoadingState extends AccounterState {}

class DeletedSucsyfllytState extends AccounterState {}

class DeletedFaliedState extends AccounterState {}

class DeletedLoadingState extends AccounterState {}

class GetAllIncomeFailedState extends AccounterState {}

class GetAllIncomeLoadingState extends AccounterState {}

class GetAllIncomeSucState extends AccounterState {}

class AddAgentsSucState extends AccounterState {}

class AddAgentsFailedState extends AccounterState {
 final String message;
  AddAgentsFailedState({required this.message});
}

class AddAgentsLoadingState extends AccounterState {}

class GetAllAgentsSucState extends AccounterState {}

class GetAllAgentsFailedState extends AccounterState {}

class GetAllAgentsLoadingState extends AccounterState {}

class DeleteAgeintsSucState extends AccounterState {}

class DeleteAgeintsFiledState extends AccounterState {}

class DeleteAgeintsLoadingState extends AccounterState {}

class UpdateAgentsSucState extends AccounterState {}

class UpdateAgentsFaliedState extends AccounterState {}

class UpdateAgentsLoadingState extends AccounterState {}

class AddInvoiceSucState extends AccounterState {}

class AddInvoiceFiledState extends AccounterState {}

class AddInvoiceLoadingState extends AccounterState {}

class getInvoiceSucState extends AccounterState {}

class GetInvoiceFaliedState extends AccounterState {}

class GetInvoiceLoadingState extends AccounterState {}

class DeleteInvoiceLoadingState extends AccounterState {}

class DeleteInvoiceSucState extends AccounterState {}

class DeleteInvoiceFaliedState extends AccounterState {}

class AddUrlLancherSucState extends AccounterState {}

class AddUrlLancherLoadingState extends AccounterState {}

class AddUrlLancherFaieldState extends AccounterState {}

class UpdateExpansessSucState extends AccounterState {}

class UpdateExpansessFaieldState extends AccounterState {}

class UpdateExpansessLoaidingState extends AccounterState {}

class UpdateRevenusSucState extends AccounterState {}

class UpdateRevenusFaliedState extends AccounterState {}

class UpdateRevenusLoadingState extends AccounterState {}

class GetQuatitionLoadingState extends AccounterState {}

class GetQuatitionSucStateState extends AccounterState {}

class GetQuatitionFaliedState extends AccounterState {}

class AddPaymentSucState extends AccounterState {}

class AddPaymentsFaieldSate extends AccounterState {
  final String message;
  AddPaymentsFaieldSate({required this.message});
}

class AddPaymentsLoadingState extends AccounterState {}

class calculateupdatasucstate extends AccounterState {}

class SearchSucState extends AccounterState {}

class SearchFailedState extends AccounterState {}

class SearchLoadingState extends AccounterState {}

class searchempty extends AccounterState {}

class SearchQSucState extends AccounterState {}

class SearchQFailedState extends AccounterState {}

class SearchQLoadingState extends AccounterState {}

class AddFormState extends AccounterState {}

class RemoveQuantityForm extends AccounterState {}

class removeFormState extends AccounterState {}

class AddQuantitysForm extends AccounterState {}

class CalucalateTotalState extends AccounterState {}

class resetFormState extends AccounterState {}

class AddUrlLancherIncomeSucState extends AccounterState {}

class AddUrlLancherIncomeFailedState extends AccounterState {}

class AddUrlLancherIncomeLoadingState extends AccounterState {}

class AddUrlLancherPdfSyriaSucState extends AccounterState {}

class AddUrlLancherPdfSyriaFiledState extends AccounterState {}

class AddUrlLancherPdfSyriaLoadingState extends AccounterState {}

class AddUrlLancherPdfDubiaLoadingState extends AccounterState {}

class AddUrlLancherPdfDubiaSucState extends AccounterState {}

class AddUrlLancherPdfDubiaFailedState extends AccounterState {}

class SearchIncomeSucState extends AccounterState {}

class SearcIncomeFaieldState extends AccounterState {}

class SearchIncomeLoading extends AccounterState {}

class SearchIExpansessLoading extends AccounterState {}

class SearchExpansessSucState extends AccounterState {}

class SearchExpansessFaliedState extends AccounterState {}

class SearchAgentsFaliedState extends AccounterState {}

class SearchAgentsSucState extends AccounterState {}

class SearchAgentsLoadingState extends AccounterState {}

class addini extends AccounterState {}

class addiniloading extends AccounterState {}

class addinifailed extends AccounterState {}

class SearchInvoiceSucState extends AccounterState {}

class SearchInvoiceLoadingState extends AccounterState {}

class SearchInvoiceFaieldState extends AccounterState {}

class DeletedPaidSucState extends AccounterState {}

class DeletedPaidFaieldState extends AccounterState {}

class DeletedPaiedLoadingState extends AccounterState {}

class CheacksState extends AccounterState {}

class GetBankSucState extends AccounterState {}

class GetBankFaieldState extends AccounterState {}

class GetBankLoadingState extends AccounterState {}

class AddBankSucState extends AccounterState {}

class AddBankFaieldState extends AccounterState {}

class AddBankLoadingState extends AccounterState {}

class DeleteBankSucState extends AccounterState {}

class DeleteBankFaliedState extends AccounterState {}

class DelteBankLoadingState extends AccounterState {}

class UpdateBankSucState extends AccounterState {}

class UpdateBankFlaiedState extends AccounterState {}

class UpdateBankLoadingState extends AccounterState {}

class GetNoteSucState extends AccounterState {}

class GetNoteFaeildState extends AccounterState {}

class GetNoteLoadingState extends AccounterState {}

class GetFilterSucState extends AccounterState {}

class GetFilterFailedState extends AccounterState {}

class GetFilterLoadingState extends AccounterState {}

class GetFilterQSucState extends AccounterState {}

class GetFilterQfalidState extends AccounterState {}

class GetFilterQLoadingState extends AccounterState {}

class GetQuaLoadingState extends AccounterState {}

class GenerateToInvoiceLoadingState extends AccounterState {}

class GenerateToInvoiceSucState extends AccounterState {}

class GenerateToInvoiceFaluerState extends AccounterState {}
class ChangeBodyScreen extends AccounterState {}
class CurrencyLoadingState extends AccounterState {}

class CurrencySucState extends AccounterState {}

class CurrencyFaluerState extends AccounterState {}
class AddCurrencyLoadingState extends AccounterState {}

class AddCurrencySucState extends AccounterState {}

class AddCurrencyFaluerState extends AccounterState {}
class ChangeDueDate extends AccounterState {}
