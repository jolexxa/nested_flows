import 'package:flutter/material.dart';
import 'package:nested_flows/bank_link/bank_link.dart';
import 'package:nested_flows/l10n/l10n.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final items = ['Bank Link'];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.homeAppBarTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.food_bank, size: 36),
            title: Text(items[index]),
            trailing: const Icon(Icons.chevron_right, size: 36),
            onTap: () {
              Navigator.of(context).push(BankLinkFlow.route());
            },
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
