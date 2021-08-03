import 'package:equatable/equatable.dart';
import 'package:nested_flows/models/models.dart';

class BankLinkFlowState extends Equatable {
  const BankLinkFlowState({this.banks});

  final List<Bank>? banks;

  @override
  List<Object?> get props => [banks];
}
