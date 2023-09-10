import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? ptText = '',
  }) =>
      [enText, esText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'nl1hwpkb': {
      'en': 'Create Story',
      'es': 'Crear historia',
      'pt': 'Criar história',
    },
    'yvqmxum9': {
      'en': 'My Stories',
      'es': 'Mis historias',
      'pt': 'Minhas histórias',
    },
    'e1j1vtet': {
      'en': 'Credits and greetings',
      'es': 'creditos y agradecimientos',
      'pt': 'Créditos e agradecimentos',
    },
    'k51zmoxx': {
      'en': 'Home',
      'es': 'Home',
      'pt': 'Home',
    },
  },
  // AuthPage
  {
    'vs3xhphu': {
      'en': 'Login with Google',
      'es': 'Iniciar sesión con Google',
      'pt': 'Faça login com o Google',
    },
    'sf9a3y60': {
      'en': 'Home',
      'es': 'Home',
      'pt': 'Home',
    },
  },
  // CreateStoryPage
  {
    'iijmxh1u': {
      'en': 'Creating a story',
      'es': 'Creando una historia',
      'pt': 'Criando uma história',
    },
    'zzrsqwxs': {
      'en': 'What is the name of the main character?',
      'es': '¿Cómo se llama el personaje principal?',
      'pt': 'Qual é o nome do personagem principal?',
    },
    '3jhv8s6q': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'jke5pzjx': {
      'en': 'What is the character\'s age?',
      'es': '¿Cuál es la edad del personaje?',
      'pt': 'Qual é a idade do personagem?',
    },
    'r7jvqu6f': {
      'en': 'What is the theme of the story?',
      'es': '¿Cuál es el tema de la historia?',
      'pt': 'Qual é o tema da história?',
    },
    'gz8u88sw': {
      'en': 'Select...',
      'es': 'Seleccionar...',
      'pt': 'Selecione...',
    },
    '1kj32na3': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'pt': 'Procure um item...',
    },
    'cpzdetn0': {
      'en': 'Create Story',
      'es': 'Crear historia',
      'pt': 'Criar história',
    },
    '0xdnvv14': {
      'en': 'Home',
      'es': 'Home',
      'pt': 'Home',
    },
  },
  // ListStoriesPage
  {
    'vn65i5h6': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'pt': 'Olá Mundo',
    },
    'au1p377w': {
      'en': 'Title',
      'es': 'Título',
      'pt': 'Título',
    },
    'i1syo1uq': {
      'en': 'Subtitle',
      'es': 'Subtitular',
      'pt': 'Legenda',
    },
    'r6g70exw': {
      'en': 'subtext',
      'es': 'trasfondo',
      'pt': 'sub-texto',
    },
    'oz3ay72t': {
      'en': 'Home',
      'es': 'Home',
      'pt': 'Home',
    },
  },
  // ViewStoryPage
  {
    'kehgbrg1': {
      'en': 'Home',
      'es': 'Home',
      'pt': 'Home',
    },
  },
  // AboutPage
  {
    'hkikmmm1': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // CreatingStoryPage
  {
    '5i59jvbg': {
      'en': 'Home',
      'es': 'Home',
      'pt': 'Home',
    },
  },
  // CreditWidget
  {
    '0pn8d7m6': {
      'en': 'Create Note',
      'es': 'Crear nota',
      'pt': 'Criar nota',
    },
    'md8rfh95': {
      'en': 'Find members by searching below',
      'es': 'Encuentre miembros buscando a continuación',
      'pt': 'Encontre membros pesquisando abaixo',
    },
    'ee2g7y70': {
      'en': 'Enter your note here...',
      'es': 'Introduce tu nota aquí...',
      'pt': 'Digite sua nota aqui...',
    },
    'p9rfdsnm': {
      'en': 'Create Note',
      'es': 'Crear nota',
      'pt': 'Criar nota',
    },
  },
  // Miscellaneous
  {
    '4215pmrg': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '23ray5k3': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'p90owz0z': {
      'en': '',
      'es': 'Email Obrigatorio',
      'pt': 'Email Obrigatorio',
    },
    'q1u0oow2': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'c8j9bji7': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'hz3j56hz': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'cdstlx1q': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '292dnsit': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'qtlxc6zd': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'vhmxp5k4': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'g42eplbz': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '3l7js6f7': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'fun5ttud': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'llq4m0pd': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'ru0zwur1': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'ronr6q86': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'cszwjpjl': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '21d6mu4l': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '7ihvmxzf': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '613at5er': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'jsjioi39': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'z1fkt2iq': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'cu5vj9sq': {
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
