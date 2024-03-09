import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'it_IT': {
          'welcome': 'Benvenuto',
          'impostazioni': 'impostazioni',
          'lang_label': 'Lingua',
        },
        'en_US': {
          'welcome': 'Welcome',
          'impostazioni': 'settings',
          'lang_label': 'Language',
        },
        'es_ES': {
          'welcome': 'Bienvenido',
          'impostazioni': 'configuración',
          'lang_label': 'Idioma',
        }
      };
}
