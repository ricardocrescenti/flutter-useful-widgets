import 'package:flutter/material.dart';

class DefaultSocialButton extends StatelessWidget{
  final bool rouded;
  final IconData icon;
  final Color buttonColor;
  final Color textColor;
  final String text;
  final Function(BuildContext context) onPressed;

  DefaultSocialButton({
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
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(this.icon, size: 20, textDirection: TextDirection.rtl,),
        ),
        style: ElevatedButton.styleFrom(
          primary: this.buttonColor,
          onPrimary: this.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),),
        ),
        onPressed: () => this.onPressed(context),
        )
    );
  }

  _buildRaisedButton(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon, size: 20,),
          Padding(padding: EdgeInsets.only(left: 10),),
          Text(this.text,)
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: this.buttonColor,
        onPrimary: this.textColor,
      ),
      onPressed: () => this.onPressed(context),
    );
  }
}