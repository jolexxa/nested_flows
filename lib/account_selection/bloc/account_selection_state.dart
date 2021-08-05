part of 'account_selection_bloc.dart';

enum AccountSelectionStatus { loading, success, failure }

class AccountSelectionState extends Equatable {
  const AccountSelectionState({
    this.accounts = const [],
    this.status = AccountSelectionStatus.loading,
  });

  final List<Account> accounts;
  final AccountSelectionStatus status;

  @override
  List<Object?> get props => [accounts, status];

  AccountSelectionState copyWith({
    List<Account>? accounts,
    AccountSelectionStatus? status,
  }) {
    return AccountSelectionState(
      accounts: accounts ?? this.accounts,
      status: status ?? this.status,
    );
  }
}
