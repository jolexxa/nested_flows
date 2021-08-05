import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nested_flows/models/models.dart';

part 'account_selection_event.dart';
part 'account_selection_state.dart';

class AccountSelectionBloc
    extends Bloc<AccountSelectionEvent, AccountSelectionState> {
  AccountSelectionBloc() : super(const AccountSelectionState());

  @override
  Stream<AccountSelectionState> mapEventToState(
    AccountSelectionEvent event,
  ) async* {
    if (event is AccountsRequested) {
      yield state.copyWith(status: AccountSelectionStatus.loading);
      final accounts = await Future.delayed(
        const Duration(seconds: 2),
        () async => const [
          Account(name: 'Account #1234567893'),
          Account(name: 'Account #0234513811'),
          Account(name: 'Account #5183138501'),
        ],
      );
      yield state.copyWith(
        accounts: accounts,
        status: AccountSelectionStatus.success,
      );
    }
  }
}
