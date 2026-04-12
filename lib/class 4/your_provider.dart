import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = StateProvider<AppState>((ref){
  return AppState(slider: 0.5, showPassword: false);
});

class AppState {
  final double slider;
  final bool showPassword;
  AppState({required this.slider, required this.showPassword});
  AppState copyWith({double? slidr, bool? showPass}) {
    return AppState(
      slider: slidr ?? this.slider,
      showPassword: showPass ?? this.showPassword,
    );
  }
}
