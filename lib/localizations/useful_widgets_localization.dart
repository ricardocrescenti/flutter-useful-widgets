import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';
import 'package:useful_widgets/useful_widgets.dart';

class UsefulWidgetsLocalizations extends SimpleLocalizations {

	static UsefulWidgetsLocalizations of(BuildContext context) {
		UsefulWidgetsLocalizations? localization = Localizations.of<UsefulWidgetsLocalizations>(context, UsefulWidgetsLocalizations);
		return localization ?? UsefulWidgetsLocalizations(Localizations.localeOf(context));
	}

	UsefulWidgetsLocalizations(Locale locale) : super(locale);

	@override
	Locale get defaultLocale => const Locale('en');

	@override
	Iterable<Locale> get suportedLocales => const [
		Locale('en'),
		Locale('es'),
		Locale('pt'),
	];

	@override
	Map<String, Map<dynamic, String>> get localizedValues => {
		'en': {
			// future_widget
			FutureWidgetMessages.retryButton: 'Try Again',
			FutureWidgetMessages.awaitMessage: 'Loading',
			FutureWidgetMessages.errorMessage: 'Could not complete request',
			// login_widget
			LoginWidgetMessages.signWithEmailAndPassword: 'Enter your email and password to login',
			LoginWidgetMessages.userNameField: 'Username',
			LoginWidgetMessages.passwordField: 'Password',
			LoginWidgetMessages.register: 'Register',
			LoginWidgetMessages.recoverPassword: 'Recover Password',
			LoginWidgetMessages.orSignWithSocialAccounts: 'Or sign in with your preferred account',
			LoginWidgetMessages.signWithSocialAccounts: 'Sign in with your preferred account',
			// search_widget
			SearchWidgetMessages.searchHint: 'Search',
			SearchWidgetMessages.searchingMessage: 'Consulting',
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
			FutureWidgetMessages.retryButton: 'Intentar Nuevamente',
			FutureWidgetMessages.awaitMessage: 'Cargando',
			FutureWidgetMessages.errorMessage: 'No se pudo completar la solicitud.',
			// login_widget
			LoginWidgetMessages.signWithEmailAndPassword: 'Ingrese su correo electrónico y contraseña para iniciar sesión',
			LoginWidgetMessages.userNameField: 'Usuario',
			LoginWidgetMessages.passwordField: 'Contraseña',
			LoginWidgetMessages.register: 'Registro',
			LoginWidgetMessages.recoverPassword: 'Recuperar contraseña',
			LoginWidgetMessages.orSignWithSocialAccounts: 'O inicie sesión con su cuenta preferida',
			LoginWidgetMessages.signWithSocialAccounts: 'Inicie sesión con su cuenta preferida',
			// search_widget
			SearchWidgetMessages.searchHint: 'Buscar',
			SearchWidgetMessages.searchingMessage: 'Consultoria',
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
			FutureWidgetMessages.retryButton: 'Tentar Novamente',
			FutureWidgetMessages.awaitMessage: 'Carregando',
			FutureWidgetMessages.errorMessage: 'Não foi possível concluir a solicitação',
			// login_widget
			LoginWidgetMessages.signWithEmailAndPassword: 'Informe o seu e-mail e senha para entrar',
			LoginWidgetMessages.userNameField: 'Usuário',
			LoginWidgetMessages.passwordField: 'Senha',
			LoginWidgetMessages.register: 'Cadastrar',
			LoginWidgetMessages.recoverPassword: 'Recuperar senha',
			LoginWidgetMessages.orSignWithSocialAccounts: 'Ou efetue login com a sua conta preferida',
			LoginWidgetMessages.signWithSocialAccounts: 'Efetue login com a sua conta preferida',
			// search_widget
			SearchWidgetMessages.searchHint: 'Procurar',
			SearchWidgetMessages.searchingMessage: 'Consultando',
			// social buttons
			SocialButtonsMessages.apple: 'Login com Apple',
			SocialButtonsMessages.facebook: 'Login com Facebook',
			SocialButtonsMessages.github: 'Login com GitHub',
			SocialButtonsMessages.google: 'Login com Google',
			SocialButtonsMessages.microsoft: 'Login com Microsoft',
			SocialButtonsMessages.twitter: 'Login com Twitter',
		}
	};

}

class UsefulWidgetsLocalizationsDelegate extends SimpleLocalizationsDelegate<UsefulWidgetsLocalizations> {

	UsefulWidgetsLocalizationsDelegate() : super();
	
	@override
	UsefulWidgetsLocalizations initializeLocalization(Locale currentLocale) {
		return UsefulWidgetsLocalizations(currentLocale);
	}

}