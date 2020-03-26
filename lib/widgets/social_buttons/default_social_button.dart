import 'package:flutter/material.dart';

class DefaultSocialButtonLogin extends StatelessWidget{
  final bool rouded;
  final IconData icon;
  final Color buttonColor;
  final Color textColor;
  final String text;
  final Function(BuildContext context) onPressed;

  DefaultSocialButtonLogin({
    @required this.rouded,
    @required this.icon, 
    @required this.buttonColor, 
    @required this.textColor, 
    @required this.text, 
    @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return (this.rouded
      ? _buildRoudedButton(context)
      : _buildRaisedButton(context));
  }

  _buildRoudedButton(BuildContext context) {
    return SizedBox(
      width: 37,
      child: RaisedButton(
        color: this.buttonColor,
        textColor: this.textColor,
        child: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(this.icon, size: 20, textDirection: TextDirection.rtl,),
        ),
        onPressed: () => this.onPressed(context),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),),
      )
    );
  }

  _buildRaisedButton(BuildContext context) {
    return RaisedButton(
      color: this.buttonColor,
      textColor: this.textColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon, size: 20,),
          Padding(padding: EdgeInsets.only(left: 10),),
          Text(this.text,)
        ],
      ),
      onPressed: () => this.onPressed(context),
    );
  }
}