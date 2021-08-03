import 'package:flutter/material.dart';
import 'package:nested_flows/l10n/l10n.dart';
import 'package:nested_flows/models/models.dart';

class BankSelectionPage extends StatelessWidget {
  const BankSelectionPage({Key? key, required this.banks}) : super(key: key);

  final List<Bank> banks;

  static MaterialPage<void> page({required List<Bank> banks}) {
    return MaterialPage(
      child: BankSelectionPage(banks: banks),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BankSelectionPageView(banks: banks);
  }
}

class BankSelectionPageView extends StatelessWidget {
  const BankSelectionPageView({Key? key, required this.banks})
      : super(key: key);

  final List<Bank> banks;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return WillPopScope(
      // Don't go back from this point in the flow.
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.bankSelectionAppBarTitle),
          // Hide the useless back button:
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.food_bank, size: 36),
              title: Text(banks[index].name),
              trailing: const Icon(Icons.chevron_right, size: 36),
            );
          },
          itemCount: banks.length,
        ),
      ),
    );
  }
}
