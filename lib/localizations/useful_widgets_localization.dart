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
      // login_widget
      LoginWidgetMessages.userNameFieldText: 'Username',
      LoginWidgetMessages.passwordFieldText: 'Password',
      LoginWidgetMessages.registerText: 'Register',
      LoginWidgetMessages.forgetPasswordText: 'Forget your password?',
      LoginWidgetMessages.orSignWithSocialAccountsText: 'Or sign in with your preferred account',
      LoginWidgetMessages.signWithSocialAccountsText: 'Sign in with your preferred account',
      // search_widget
      SearchWidgetMessages.searchHint: 'Search',
      // social buttons
      SocialButtonsMessages.apple: 'Login with Apple',
      SocialButtonsMessages.facebook: 'Login with Facebook',
      SocialButtonsMessages.github: 'Login with GitHub',
      SocialButtonsMessages.google: 'Login with Google',
      SocialButtonsMessages.microsoft: 'Login with Microsoft',
      SocialButtonsMessages.twitter: 'Login with Twitter',
    },
    'es': {
      // future_widget
      FutureWidgetMessages.retryButtonText: 'Intentar Nuevamente',
      FutureWidgetMessages.awaitMessage: 'Cargando',
      FutureWidgetMessages.errorMessage: 'No se pudo completar la solicitud.',
      // login_widget
      LoginWidgetMessages.userNameFieldText: 'Usuario',
      LoginWidgetMessages.passwordFieldText: 'Contraseña',
      LoginWidgetMessages.registerText: 'Registro',
      LoginWidgetMessages.forgetPasswordText: '¿Olvidaste tu contraseña?',
      LoginWidgetMessages.orSignWithSocialAccountsText: 'O inicie sesión con su cuenta preferida',
      LoginWidgetMessages.signWithSocialAccountsText: 'Inicie sesión con su cuenta preferida',
      // search_widget
      SearchWidgetMessages.searchHint: 'Buscar',
      // social buttons
      SocialButtonsMessages.apple: 'Login con Apple',
      SocialButtonsMessages.facebook: 'Login con Facebook',
      SocialButtonsMessages.github: 'Login con GitHub',
      SocialButtonsMessages.google: 'Login con Google',
      SocialButtonsMessages.microsoft: 'Login con Microsoft',
      SocialButtonsMessages.twitter: 'Login con Twitter',
    },
    'pt': {
      // future_widget
      FutureWidgetMessages.retryButtonText: 'Tentar Novamente',
      FutureWidgetMessages.awaitMessage: 'Carregando',
      FutureWidgetMessages.errorMessage: 'Não foi possível concluir a solicitação',
      // login_widget
      LoginWidgetMessages.userNameFieldText: 'Usuário',
      LoginWidgetMessages.passwordFieldText: 'Senha',
      LoginWidgetMessages.registerText: 'Cadastrar',
      LoginWidgetMessages.forgetPasswordText: 'Esqueceu sua senha?',
      LoginWidgetMessages.orSignWithSocialAccountsText: 'Ou efetue login com a sua conta preferida',
      LoginWidgetMessages.signWithSocialAccountsText: 'Efetue login com a sua conta preferida',
      // search_widget
      SearchWidgetMessages.searchHint: 'Procurar',
      // social buttons
      SocialButtonsMessages.apple: 'Login com Apple',
      SocialButtonsMessages.facebook: 'Login com Facebook',
      SocialButtonsMessages.github: 'Login com GitHub',
      SocialButtonsMessages.google: 'Login com Google',
      SocialButtonsMessages.microsoft: 'Login com Microsoft',
      SocialButtonsMessages.twitter: 'Login com Twitter',
    }
  };

  @override
  Iterable<Locale> get suportedLocales => [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];
}

class UsefulWidgetsLocalizationsDelegate extends SimpleLocalizationsDelegate<UsefulWidgetsLocalizations> {
  UsefulWidgetsLocalizationsDelegate(customLocalization) : super(customLocalization);
}