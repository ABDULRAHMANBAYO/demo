import 'package:demo/widget_utils.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class CustomAppBar extends StatelessWidget {
  final bool isInputPage;

  const CustomAppBar({Key key, this.isInputPage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(screenAwareSize(16.0, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildPrefixIcon(context),
              _buildImageIcon(context),
              _buildLabel(context),
              _buildSuffixIcon(context),
              _buildIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildPrefixIcon(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),
        child: Icon(Icons.list));
  }

  Padding _buildSuffixIcon(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right:100.0,),
        child: Icon(Icons.keyboard_arrow_down));
  }
   Padding _buildImageIcon(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left:80.0,),
        child: CircleAvatar(
 backgroundImage: AssetImage('assets/images/model.jpg'),
 radius: 13,
        ),
       );
  }
  

  Padding _buildIcon(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),
        child: Icon(Icons.add_circle_outline));
  }

  RichText _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 22.0),
        children: [
          TextSpan(
            text: "Sammy",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
