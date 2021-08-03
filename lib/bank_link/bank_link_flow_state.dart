import 'package:equatable/equatable.dart';
import 'package:nested_flows/models/models.dart';

class BankLinkFlowState extends Equatable {
  const BankLinkFlowState({
    this.banks,
    this.accounts,
    this.selectedAccount,
    this.selectedBank,
  });

  final List<Bank>? banks;
  final List<Account>? accounts;
  final Bank? selectedBank;
  final Account? selectedAccount;

  @override
  List<Object?> get props => [
        banks,
        accounts,
        selectedAccount,
        selectedBank,
      ];
}
