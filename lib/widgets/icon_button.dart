import 'package:card/game_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconBtn extends StatelessWidget {
  const IconBtn(
      {Key? key,
      this.onPressed,
      this.icon,
      this.enabled = false,
      this.colorEnabled = Colors.black,
      this.colorDisabled = Colors.white,
      this.size = 20})
      : super(key: key);
  final void Function()? onPressed;
  final IconData? icon;
  final bool enabled;
  final Color colorEnabled;
  final Color colorDisabled;
  final double size;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameModel>(context);
    return IconButton(
      onPressed: enabled && !provider.played ? onPressed : null,
      icon: Icon(
        icon,
        color: enabled && !provider.played ? colorEnabled : colorDisabled,
        size: size,
      ),
    );
  }
}
