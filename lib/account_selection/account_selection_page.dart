import 'package:flutter/material.dart';
import 'package:nested_flows/l10n/l10n.dart';
import 'package:nested_flows/models/models.dart';

class AccountSelectionPage extends StatelessWidget {
  const AccountSelectionPage({Key? key, required this.accounts})
      : super(key: key);

  final List<Account> accounts;

  static MaterialPage<void> page({required List<Account> accounts}) {
    return MaterialPage(
      key: UniqueKey(),
      child: AccountSelectionPage(accounts: accounts),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AccountSelectionPageView(accounts: accounts);
  }
}

class AccountSelectionPageView extends StatelessWidget {
  const AccountSelectionPageView({Key? key, required this.accounts})
      : super(key: key);

  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.accountSelectionAppBarTitle),
      ),
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
