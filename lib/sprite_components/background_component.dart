import 'package:flame/components.dart';
import 'package:gift_grab_game/config/constants.dart';

class BackgroundComponent extends SpriteComponent with HasGameReference {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite(Constants.backgroundSprite);
    size = game.size;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size;
  }
}
