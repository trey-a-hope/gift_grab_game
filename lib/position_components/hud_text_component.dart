import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gift_grab_game/blocs/game/game_bloc.dart';
// import 'package:gift_grab_ui/ui.dart';

class HUDTextComponents extends PositionComponent
    with HasGameReference, FlameBlocListenable<GameBloc, GameState> {
  late TextComponent _scoreText;
  late TextComponent _timerText;

  static const _topPadding = 40.0;
  static const _edgePadding = 50.0;

  static const _textStyle = TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  HUDTextComponents();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _timerText = TextComponent(
      text: 'Time: 0',
      position: Vector2(_topPadding, _edgePadding),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(style: _textStyle),
    );

    _scoreText = TextComponent(
      text: 'Score: 0',
      position: Vector2(game.size.x - _topPadding, _edgePadding),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(style: _textStyle),
    );

    add(_timerText);
    add(_scoreText);
  }

  @override
  void onNewState(GameState state) {
    _scoreText.text = 'Score: ${state.score}';
    _timerText.text = 'Time: ${state.remainingTime}';
  }
}
