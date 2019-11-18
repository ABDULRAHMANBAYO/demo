
import 'package:demo/widget_utils.dart';

import 'package:flutter/material.dart';


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
              _buildLabel(context),
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
      child:Icon(Icons.arrow_back)
    );
  }

  Padding _buildIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),
      child:Icon(Icons.add_circle_outline)
    );
  }

  RichText _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 34.0),
        children: [
          TextSpan(
            text: "Medical Notes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // TextSpan(text: isInputPage ? getEmoji(context) : ""),
        ],
      ),
    );
  }
}