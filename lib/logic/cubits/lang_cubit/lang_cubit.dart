import 'package:bloc/bloc.dart';
import 'package:store_app/data/constants/lang.dart';
import 'package:store_app/data/keys/prefs_keys.dart';
import 'package:store_app/data/services/prefs_service.dart';

class LangCubit extends Cubit<String> {
  LangCubit() : super('ar');
  Future<void> changeLang({
    required bool isArabic,
  }) async {
    final lang = isArabic ? LangCode.arabic : LangCode.english;
    final result = await PrefsService.setValue(
      key: PrefsKeys.lang,
      value: lang,
    );
    if (result) {
      emit(lang);
    }
  }

  void getLang() async {
    final lang = await PrefsService.getString(PrefsKeys.lang);
    if (lang == null) {
      emit(LangCode.arabic);
    } else {
      emit(lang);
    }
  }
}
