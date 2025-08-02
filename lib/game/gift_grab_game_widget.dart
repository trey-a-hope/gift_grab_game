import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gift_grab_game/config/enums/screens.dart';
import 'package:gift_grab_game/game.dart';

class GiftGrabGameWidget extends StatelessWidget {
  final Function(int) onEndGame;

  const GiftGrabGameWidget({required this.onEndGame, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: GameWidget<GiftGrabGame>(
      game: GiftGrabGame(onEndGame: onEndGame),
      overlayBuilderMap: {
        Screens.gameOver.name: (context, game) =>
            GameOverOverlay(game.score, game.resetGame!),
      },
    ),
  );
}
