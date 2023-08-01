import 'package:bloc/bloc.dart';
import 'package:store_app/data/keys/prefs_keys.dart';
import 'package:store_app/data/services/prefs_service.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  //?this switch theme take a boolean value
  //?this value if true then dark theme activate
  //?else light theme activate
  void switchTheme({
    required bool isDark,
  }) async {
    final result = await PrefsService.setValue(
      key: PrefsKeys.theme,
      value: isDark,
    );
    if (result) {
      emit(isDark);
    }
  }

  void getCurrentTheme() async {
    final isDark = await PrefsService.getBool(PrefsKeys.theme);
    if (isDark == null) {
      emit(false);
    } else {
      emit(isDark);
    }
  }
}
