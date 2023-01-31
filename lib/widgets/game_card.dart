import 'package:card/game_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'icon_button.dart';

class GameCard extends StatelessWidget {
  const GameCard({Key? key, this.height = 130, this.width = 96})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int index = 0; index < 3; index++)
          Column(
            children: [
              Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 1,
                  ),
                ),
                child: provider.played
                    ? index == provider.secretKey
                        ? flutterCard()
                        : emptyCard()
                    : imageCard(),
              ),
              const SizedBox(height: 10),
              betWidget(context, index, provider)
            ],
          ),
      ],
    );
  }

  Widget flutterCard() {
    return Column(
      children: const [FlutterLogo(
        size: 70,
      
      ), SizedBox(height: 10), Text('Flutter', style: TextStyle(fontSize: 21),)],
    );
  }

  Widget emptyCard() {
    return Container(
      height: height - 10,
      width: width - 10,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }

  Widget imageCard() {
    return Image.asset('assets/images/card.jpg');
  }

  Widget betWidget(BuildContext context, int index, GameModel provider) {
    return Container(
      height: height / 3,
      width: width + 8,
      color: Colors.lightBlueAccent,
      child: Row(children: [
        IconBtn(
          icon: Icons.remove,
          enabled: provider.card[index] > 0,
          onPressed: () => provider.removeCoins(index),
        ),
        Text(
          provider.card[index].toString(),
        ),
        IconBtn(
          icon: Icons.add,
          enabled: provider.card[index] < 3 && provider.balance > 0,
          onPressed: () => provider.addCoins(index),
        ),
      ]),
    );
  }
}
