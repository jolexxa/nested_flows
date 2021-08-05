import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_flows/bank_link/bank_link.dart';
import 'package:nested_flows/bank_selection/bank_selection.dart';
import 'package:nested_flows/l10n/l10n.dart';
import 'package:nested_flows/models/models.dart';
import 'package:nested_flows/utility/utility.dart';

class BankSelectionPage extends StatelessWidget {
  const BankSelectionPage({Key? key}) : super(key: key);

  static Page<void> page() {
    return PageWithoutAnimation<void>(
      key: UniqueKey(),
      child: const BankSelectionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BankSelectionBloc()..add(const BanksRequested()),
      child: const BankSelectionPageView(),
    );
  }
}

class BankSelectionPageView extends StatelessWidget {
  const BankSelectionPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BankSelectionBloc>().state;

    switch (state.status) {
      case BankSelectionStatus.loading:
        return const _LoadingScreen();
      case BankSelectionStatus.success:
        return _BanksList(banks: state.banks);
      case BankSelectionStatus.failure:
        return const _BankSelectionError();
    }
  }
}

class _BanksList extends StatelessWidget {
  const _BanksList({Key? key, required this.banks}) : super(key: key);

  final List<Bank> banks;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.bankSelectionAppBarTitle),
        // First page of a flow must end the flow to enable going back to the
        // previous flow/navigator.
        leading: BackButton(
          onPressed: () => context.flow<BankLinkFlowState>().complete(),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.food_bank, size: 36),
            title: Text(banks[index].name),
            trailing: const Icon(Icons.chevron_right, size: 36),
            onTap: () {
              context
                  .flow<BankLinkFlowState>()
                  .update((_) => BankLinkFlowState(selectedBank: banks[index]));
            },
          );
        },
        itemCount: banks.length,
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class _BankSelectionError extends StatelessWidget {
  const _BankSelectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Something went wrong!')),
    );
  }
}
