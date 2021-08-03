import 'dart:developer';

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:nested_flows/account_selection/account_selection.dart';
import 'package:nested_flows/account_selection/account_selection_page.dart';
import 'package:nested_flows/bank_link/bank_link_flow_state.dart';
import 'package:nested_flows/bank_selection/bank_selection.dart';
import 'package:nested_flows/loading/loading.dart';
import 'package:nested_flows/models/models.dart';

class BankLinkFlow extends StatelessWidget {
  const BankLinkFlow({Key? key}) : super(key: key);

  static Route<BankLinkFlowState> route() {
    return MaterialPageRoute(
      builder: (_) => const BankLinkFlow(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FlowBuilder<BankLinkFlowState>(
      state: BankLinkFlowState(),
      onGeneratePages: onGeneratePages,
    );
  }

  static List<Page> onGeneratePages(BankLinkFlowState state, List<Page> pages) {
    log('state: $state');
    return [
      LoadingScreen.page<List<Bank>>(
        load: () async {
          return Future.delayed(
            const Duration(seconds: 2),
            () async => const [
              Bank(name: 'My First Bank'),
              Bank(name: 'Big Conglomerate of Banks'),
              Bank(name: 'Bankiest Bank'),
              Bank(name: 'Capitalist Corp.'),
            ],
          );
        },
        onSuccess: (context, data) {
          context
              .flow<BankLinkFlowState>()
              .update((flowState) => BankLinkFlowState(banks: data));
        },
        onError: (context, error) {
          context.flow<BankLinkFlowState>().complete();
        },
      ),
      if (state.banks != null)
        BankSelectionPage.page(
          banks: state.banks ?? [],
        ),
      if (state.selectedBank != null)
        if (state.accounts == null)
          LoadingScreen.page<List<Account>>(
            load: () async {
              return Future.delayed(
                const Duration(seconds: 2),
                () async => const [
                  Account(name: 'Account #1234567893'),
                  Account(name: 'Account #0234513811'),
                  Account(name: 'Account #5183138501'),
                ],
              );
            },
            onSuccess: (context, data) {
              context.flow<BankLinkFlowState>().update(
                    (flowState) => BankLinkFlowState(
                      banks: flowState.banks,
                      accounts: data,
                      selectedBank: flowState.selectedBank,
                    ),
                  );
            },
            onError: (context, error) {
              context.flow<BankLinkFlowState>().complete();
            },
          )
        else
          AccountSelectionPage.page(
            accounts: state.accounts ?? [],
          ),
    ];
  }
}
