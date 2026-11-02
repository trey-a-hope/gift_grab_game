# Gift Grab Game

The playable core of **Gift Grab**, a Christmas arcade game built with [Flame](https://flame-engine.org): steer Santa with a joystick and grab as many gifts as you can in 30 seconds while dodging ice. This repo packages the game itself so a host app (such as [gift_grab_client](https://github.com/trey-a-hope/gift_grab_client)) can drop it in as a widget and receive the final score.

## Gameplay

- **Gifts** add a point each.
- **Ice** freezes Santa for 3 seconds.
- **Flames** appear at random times; touching one makes Santa immune to ice until its countdown runs out.
- **Cookies** appear at random times and give a 7-second speed boost.
- The round ends after 30 seconds (`Constants.gameTimeLimit`) and shows a game-over overlay with the score.
- Sound effects play for grabs, freezes and flames (`flame_audio`).

## How it works

`GiftGrabGame` (`lib/game/gift_grab_game.dart`) is a `FlameGame` that mounts a `GameBloc` through `flame_bloc`. The bloc (`lib/blocs/game/`) owns the score, the round timer, and the freeze, flame and speed-boost countdowns; components read its state and send events:

- `SantaComponent` moves with the joystick at `state.santaSpeed` and turns collisions into bloc events.
- `GiftSpawner`, `FlameSpawner` and `CookieSpawner` place pickups; `IceComponent`s bounce around the arena.
- `GameStateHandler` watches for the end of the round, calls your `onEndGame(score)` callback and shows the `gameOver` overlay.

```
lib/
├── game.dart                 # barrel export
├── game/                     # GiftGrabGame, GiftGrabGameWidget, GameStateHandler
├── blocs/game/               # GameBloc, events, state
├── sprite_components/        # santa, gift, ice, flame, cookie, background
├── spawners/                 # gift, flame and cookie spawners
├── inputs/joystick.dart
├── position_components/      # HUD text
├── widgets/game_over_overlay.dart
└── config/                   # constants (time limit, sprite and sound names)
```

## Tech stack

- Flutter, Dart `^3.8.1`
- `flame` 1.28, `flame_bloc`, `flame_audio`
- `flutter_bloc`, `equatable`

## Using it in an app

Add it as a git or path dependency (it isn't published to pub.dev), then:

```dart
import 'package:gift_grab_game/game/gift_grab_game_widget.dart';

GiftGrabGameWidget(
  onEndGame: (score) {
    // save the score, submit to a leaderboard, etc.
  },
);
```

The game loads the images and sounds named in `lib/config/constants.dart` (for example `santa-idle.png`, `gift-sprite.png`, `item-grab-sound.wav`). This repo doesn't ship an `assets/` folder, so the host app has to provide those files in its own `assets/images/` and `assets/audio/` and declare them in its `pubspec.yaml`.

## Development

```sh
flutter pub get
flutter analyze
flutter test
```

Platform folders exist for Android, iOS, web, macOS, Windows and Linux.
