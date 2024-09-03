part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {
  const SplashEvent();
}

class NavigateLogInEvent extends SplashEvent {
  const NavigateLogInEvent();
}

class NavigateMainEvent extends SplashEvent {
  const NavigateMainEvent();
}

class SessionCheckEvent extends SplashEvent {
  const SessionCheckEvent();
}
