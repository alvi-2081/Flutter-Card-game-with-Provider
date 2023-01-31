import 'package:card/game_model.dart';
import 'package:card/widgets/play_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/game_card.dart';
import 'widgets/text_button.dart';

class GameRoute extends StatefulWidget {
  const GameRoute({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GameRoute> createState() => _GameRouteState();
}

class _GameRouteState extends State<GameRoute> {
  bool showKey = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TxtButton(
              text: showKey ? 'Hide key' : 'Show key',
              onPressed: () => setState(() => showKey = !showKey))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          children: [
            Visibility(
              visible: showKey,
              child: Container(
                color: Colors.black,
                child: Text(
                  'SECRET: (The flutter is at card -${provider.secretKey})',
                  style: const TextStyle(color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Balance: ${provider.balance} coins (Debts: ${provider.debt} coins)',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            const GameCard(),
            const SizedBox(height: 20),
            PlayButton(
                onPressed: provider.balance == 0 && provider.played
                    ? null
                    : () =>
                        provider.played ? provider.reset() : provider.play()),
            const SizedBox(height: 20),
            Visibility(
              visible: provider.played,
              child: Text(
                'You won: ${provider.card[provider.secretKey]} (bet) x 3 = ${provider.wonAmount} coin(s)',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 7),
            Visibility(
              visible: provider.played && provider.balance == 0,
              child: Text(
                'No balance. Loan to play',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: provider.played && provider.balance == 0,
              child: ElevatedButton(
                onPressed: () => provider.addDebt(),
                child: const Text('Borrow 8 coins'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
