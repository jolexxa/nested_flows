import 'package:equatable/equatable.dart';
import 'package:nested_flows/models/models.dart';

class BankLinkFlowState extends Equatable {
  const BankLinkFlowState({this.selectedAccount, this.selectedBank});

  final Bank? selectedBank;
  final Account? selectedAccount;

  @override
  List<Object?> get props => [selectedAccount, selectedBank];
}
