import 'package:equatable/equatable.dart';

import '../../router/packages.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  static final List<String> _texts = [
    "فارسی",
    "English",
    "العربية",
    "Türkçe",
  ];
  LanguageCubit() : super(const Farsi(next: 'بعدی', n: 1));

  updateLanguage(int index) {
    switch (index) {
      case 0:
        emit(const Farsi(next: 'بعدی', n: 1));
        break;
      case 1:
        emit(const English(next: 'next', n: 2));
        break;
      case 2:
        emit(const Arabic(next: 'التالي', n: 3));
        break;
      case 3:
        emit(const Turkish(next: 'Sonraki', n: 4));
        break;
      default:
    }
  }

  get len => _texts.length;
  getLanguage(int index) => _texts[index];
}
