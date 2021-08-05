part of 'account_selection_bloc.dart';

abstract class AccountSelectionEvent extends Equatable {
  const AccountSelectionEvent();

  @override
  List<Object> get props => [];
}

class AccountsRequested extends AccountSelectionEvent {
  const AccountsRequested();
}

class AccountSelected extends AccountSelectionEvent {
  const AccountSelected({required this.account});
  final Account account;

  @override
  List<Object> get props => [account];
}
