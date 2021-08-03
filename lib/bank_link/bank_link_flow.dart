import 'dart:developer';

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
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
    log('pages: $pages');
    return [
      LoadingScreen.page<List<Bank>>(
        load: () async {
          return Future.delayed(
            const Duration(seconds: 2),
            () async => const [Bank(name: 'My First Bank')],
          );
        },
        onSuccess: (context, data) {
          context
              .flow<BankLinkFlowState>()
              .update((flowState) => flowState.copyWith(banks: data));
        },
        onError: (context, error) {
          context.flow<BankLinkFlowState>().complete();
        },
      ),
      if (state.banks != null)
        BankSelectionPage.page(
          banks: state.banks ?? [],
        ),
    ];
  }
}
