import 'package:card/game_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key, this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameModel>(context);
    final play = provider.played;
    return ElevatedButton(
        onPressed:
            provider.card[0] > 0 || provider.card[1] > 0 || provider.card[2] > 0 
                ? onPressed
                : null,
        child: Text(
          play ? 'New Game' : 'Play',
          style: TextStyle(
              color: play ? Colors.white : Colors.yellow,
              fontSize: play ? 14 : 21),
        ));
  }
}
