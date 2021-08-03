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

  BankLinkFlowState copyWith({
    List<Bank>? banks,
    List<Account>? accounts,
    Bank? selectedBank,
    Account? selectedAccount,
  }) {
    return BankLinkFlowState(
      banks: banks ?? this.banks,
      accounts: accounts ?? this.accounts,
      selectedBank: selectedBank ?? this.selectedBank,
      selectedAccount: selectedAccount ?? this.selectedAccount,
    );
  }

  @override
  List<Object?> get props => [banks];
}
