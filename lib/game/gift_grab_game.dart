import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gift_grab_game/blocs/game/game_bloc.dart';
import 'package:gift_grab_game/inputs/joystick.dart';
import 'package:gift_grab_game/position_components/hud_text_component.dart';
import 'package:gift_grab_game/spawners/cookie_spawner.dart';
import 'package:gift_grab_game/spawners/flame_spawner.dart';
import 'package:gift_grab_game/spawners/gift_spawner.dart';
import 'package:gift_grab_game/sprite_components/background_component.dart';
import 'package:gift_grab_game/sprite_components/ice_component.dart';
import 'package:gift_grab_game/sprite_components/santa_component.dart';

part 'game_state_handler.dart';

class GiftGrabGame extends FlameGame with DragCallbacks, HasCollisionDetection {
  // Store state variables on the widget since Flame overlays are part of
  // the game engine system, and Flutter Bloc is part of the widget system.
  int score = 0;
  Function()? resetGame;

  late final JoystickComponent _joystick;

  final Function(int) onEndGame;

  GiftGrabGame({required this.onEndGame}) {
    _joystick = createJoystick();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(
      FlameBlocProvider<GameBloc, GameState>(
        create: () => GameBloc()..add(StartGameEvent()),
        children: [
          PositionComponent(
            size: size,
            children: [
              GameStateHandler(onEndGame),
              BackgroundComponent(),
              SantaComponent(joystick: _joystick),
              HUDTextComponents(),
              FlameSpawner(),
              GiftSpawner(),
              CookieSpawner(),
              IceComponent(),
            ],
          ),
        ],
      ),
    );

    await add(_joystick);
  }
}
