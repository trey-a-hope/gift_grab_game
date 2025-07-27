import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:gift_grab_game/blocs/game/game_bloc.dart';
import 'package:gift_grab_game/sprite_components/cookie_component.dart';

class CookieSpawner extends Component
    with HasGameReference, FlameBlocListenable<GameBloc, GameState> {
  bool _hasSpawned = false;

  @override
  void onNewState(GameState state) {
    if (state.isCookieSpawned && !_hasSpawned) {
      _hasSpawned = true;
      final randomPosition = Vector2(
        Random().nextDouble() * game.size.x,
        Random().nextDouble() * game.size.y,
      );
      add(CookieComponent(startPosition: randomPosition));
    }
  }
}
