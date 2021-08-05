part of 'bank_selection_bloc.dart';

abstract class BankSelectionEvent extends Equatable {
  const BankSelectionEvent();

  @override
  List<Object> get props => [];
}

class BanksRequested extends BankSelectionEvent {
  const BanksRequested();
}

class BankSelected extends BankSelectionEvent {
  const BankSelected({required this.bank});
  final Bank bank;

  @override
  List<Object> get props => [bank];
}
