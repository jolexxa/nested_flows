part of 'bank_selection_bloc.dart';

enum BankSelectionStatus { loading, success, failure }

class BankSelectionState extends Equatable {
  const BankSelectionState({
    this.banks = const [],
    this.status = BankSelectionStatus.loading,
  });

  final List<Bank> banks;
  final BankSelectionStatus status;

  @override
  List<Object?> get props => [banks, status];

  BankSelectionState copyWith({
    List<Bank>? banks,
    BankSelectionStatus? status,
  }) {
    return BankSelectionState(
      banks: banks ?? this.banks,
      status: status ?? this.status,
    );
  }
}
