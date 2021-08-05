import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nested_flows/models/models.dart';

part 'bank_selection_event.dart';
part 'bank_selection_state.dart';

class BankSelectionBloc extends Bloc<BankSelectionEvent, BankSelectionState> {
  BankSelectionBloc() : super(const BankSelectionState());

  @override
  Stream<BankSelectionState> mapEventToState(
    BankSelectionEvent event,
  ) async* {
    if (event is BanksRequested) {
      yield state.copyWith(status: BankSelectionStatus.loading);
      final banks = await Future.delayed(
        const Duration(seconds: 2),
        () async => const [
          Bank(name: 'My First Bank'),
          Bank(name: 'Big Conglomerate of Banks'),
          Bank(name: 'Bankiest Bank'),
          Bank(name: 'Capitalist Corp.'),
        ],
      );
      yield state.copyWith(banks: banks, status: BankSelectionStatus.success);
    }
  }
}
