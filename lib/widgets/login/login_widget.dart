import 'package:flutter/material.dart';
import 'package:simple_form/simple_form.dart';
import 'package:useful_widgets/useful_widgets.dart';

class LoginWidget extends StatefulWidget {
  final Widget logo;
  final Function(BuildContext context, String username, String password) onLoginClick;
  final Function(BuildContext context, String username) onRecoverPasswordClick;
  final Function(BuildContext context) onRegisterClick;
  final List<Widget> socialLoginButtons;
  final EdgeInsetsGeometry padding;

  LoginWidget({
    this.logo,
    this.onLoginClick,
    this.onRecoverPasswordClick,
    this.onRegisterClick,
    this.socialLoginButtons,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
  });

  @override
  State<StatefulWidget> createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  GlobalKey<FormState> formState = GlobalKey();
  Map<String, dynamic> formValue = {
    'username': '',
    'password': ''
  };

  UsefulWidgetsLocalizations localization;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.localization = UsefulWidgetsLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          _buildBackground(),
          Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: _buildScreen(context)
          ),
        ]
      )
    );
  }

  _buildBackground() {
    return Container();
  }

  _buildScreen(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
      padding: widget.padding,
      child: Column(
        children: [
          _buildLogo(),
          _buildForm(context),
          _buildSocialLoginButtons(context)
        ].where((item) => item != null).toList().cast<Widget>(),
      ),
    ));
  }

  _buildLogo() {
    if (widget.logo != null) {
      return 
					Padding(
						padding: EdgeInsets.only(bottom: 30),
						child: widget.logo
					);
    }
    return null;
  }
  
  _buildForm(BuildContext context) {
    if (widget.onLoginClick == null) {
      return null;
    }

    return SimpleForm(
      key: formState,
      initialValues: formValue,
      onChange: (fieldNane, newValue) => formValue[fieldNane] = newValue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(localization[LoginWidgetMessages.signWithEmailAndPassword], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: SimpleTextField(
              fieldName: 'username', 
              title: localization[LoginWidgetMessages.userNameField], 
              textCapitalization: TextCapitalization.none, 
              inputDecoration: InputDecoration(
                labelText: localization[LoginWidgetMessages.userNameField],
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: SimpleTextField(
              fieldName: 'password', 
              title: localization[LoginWidgetMessages.passwordField], 
              textCapitalization: TextCapitalization.none, 
              obscureText: true,
              inputDecoration: InputDecoration(
                labelText: localization[LoginWidgetMessages.passwordField],
                prefixIcon: Icon(Icons.lock)
              ),
            ),
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () => widget.onLoginClick(context, formValue['username'], formValue['password']),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              (widget.onRegisterClick != null 
                ? FlatButton(
                  child: Text(localization[LoginWidgetMessages.register]),
                  onPressed: () => widget.onRegisterClick(context),
                )
                : null),
              (widget.onRecoverPasswordClick != null
                ? FlatButton(
                  child: Text(localization[LoginWidgetMessages.recoverPassword]),
                  onPressed: () => widget.onRecoverPasswordClick(context, formValue['username']),
                )
                : null)
            ].where((item) => item != null).toList().cast<Widget>()
          )
        ],
      ),
    );
  }
  
  _buildSocialLoginButtons(BuildContext context) {
    if (widget.socialLoginButtons != null && widget.socialLoginButtons.isNotEmpty) {
      List<Widget> widgets = [
        Padding(
          padding: EdgeInsets.only(
            top: (widget.onLoginClick == null ? 20 : 0),
            bottom: 5),
          child: (widget.onLoginClick != null ? Divider() : Container()),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(localization[widget.onLoginClick == null ? LoginWidgetMessages.signWithSocialAccounts : LoginWidgetMessages.orSignWithSocialAccounts], style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
        ),
      ];
      widgets.addAll(widget.socialLoginButtons); 
      
      return Column(
        children: widgets
      );
    }
    return null;
  }

  padding(double padding) {
    return Padding(padding: EdgeInsets.only(top: padding, left: padding));
  }
}