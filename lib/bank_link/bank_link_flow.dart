import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:nested_flows/bank_link/bank_link_flow_state.dart';

class BankLinkFlow extends StatelessWidget {
  const BankLinkFlow({Key? key, required this.controller}) : super(key: key);

  static Route<BankLinkFlowState> route(
      {required FlowController<BankLinkFlowState> controller}) {
    return MaterialPageRoute(
      builder: (_) => BankLinkFlow(
        controller: controller,
      ),
    );
  }

  final FlowController<BankLinkFlowState> controller;

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<BankLinkFlowState>(
      controller: controller,
      onGeneratePages: onGeneratePages,
    );
  }

  static List<Page> onGeneratePages(BankLinkFlowState state, List<Page> pages) {
    return [];
  }
}
