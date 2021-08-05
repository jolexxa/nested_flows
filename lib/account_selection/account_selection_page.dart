import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_flows/account_selection/account_selection.dart';
import 'package:nested_flows/l10n/l10n.dart';
import 'package:nested_flows/models/models.dart';
import 'package:nested_flows/utility/utility.dart';

class AccountSelectionPage extends StatelessWidget {
  const AccountSelectionPage({Key? key}) : super(key: key);

  static Page<void> page() {
    return PageWithoutEnter<void>(
      key: UniqueKey(),
      child: const AccountSelectionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountSelectionBloc()..add(const AccountsRequested()),
      child: const AccountSelectionPageView(),
    );
  }
}

class AccountSelectionPageView extends StatelessWidget {
  const AccountSelectionPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountSelectionBloc>().state;

    switch (state.status) {
      case AccountSelectionStatus.loading:
        return const _LoadingScreen();
      case AccountSelectionStatus.success:
        return _AccountsList(accounts: state.accounts);
      case AccountSelectionStatus.failure:
        return const _AccountSelectionError();
    }
  }
}

class _AccountsList extends StatelessWidget {
  const _AccountsList({Key? key, required this.accounts}) : super(key: key);
  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.accountSelectionAppBarTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.account_balance, size: 36),
            title: Text(accounts[index].name),
            trailing: const Icon(Icons.chevron_right, size: 36),
          );
        },
        itemCount: accounts.length,
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

class _AccountSelectionError extends StatelessWidget {
  const _AccountSelectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Something went wrong!')),
    );
  }
}
