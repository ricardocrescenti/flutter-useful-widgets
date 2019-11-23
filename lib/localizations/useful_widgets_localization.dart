import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';
import 'package:useful_widgets/useful_widgets.dart';

class UsefulWidgetsLocalizations extends SimpleLocalizations {
  static UsefulWidgetsLocalizations of(BuildContext context) {
    UsefulWidgetsLocalizations localization = Localizations.of<UsefulWidgetsLocalizations>(context, UsefulWidgetsLocalizations);
    return localization ?? UsefulWidgetsLocalizations(Localizations.localeOf(context));
  }

  UsefulWidgetsLocalizations(Locale locale) : super(locale);

  @override
  Locale get defaultLocale => Locale('en');

  @override
  Map<String, Map<dynamic, String>> get localizedValues => {
    'en': {
      // future_widget
      FutureWidgetMessages.retryButtonText: 'Try Again',
      FutureWidgetMessages.awaitMessage: 'Loading',
      FutureWidgetMessages.errorMessage: 'Could not complete request',
      // search_widget
      SearchWidgetMessages.searchHint: 'Search',
    },
    'es': {
      // future_widget
      FutureWidgetMessages.retryButtonText: 'Intentar Nuevamente',
      FutureWidgetMessages.awaitMessage: 'Cargando',
      FutureWidgetMessages.errorMessage: 'No se pudo completar la solicitud.',
      // search_widget
      SearchWidgetMessages.searchHint: 'Buscar',
    },
    'pt': {
      // future_widget
      FutureWidgetMessages.retryButtonText: 'Tentar Novamente',
      FutureWidgetMessages.awaitMessage: 'Carregando',
      FutureWidgetMessages.errorMessage: 'Não foi possível concluir a solicitação',
      // search_widget
      SearchWidgetMessages.searchHint: 'Procurar',
    }
  };

  @override
  Iterable<Locale> get suportedLocales => [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];
}