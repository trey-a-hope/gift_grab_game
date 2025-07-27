part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {}

class StartGameEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResetGameEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TimerTickEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ScorePointEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// Flame related events
class DisplayFlameEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class StartFlameCountdownEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FlameTickEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// Santa related events
class FreezeSantaEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UnfreezeSantaEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// Cookie related events
class DisplayCookieEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class StartSpeedBoostCountdownEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SpeedBoostTickEvent extends GameEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
