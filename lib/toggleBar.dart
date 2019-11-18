import 'package:demo/utils/bubble_indicator_painter.dart';
import 'package:flutter/material.dart';

Widget _toggleBar(BuildContext context, _pageController, left, right) {
  return Container(
    width: 300.0,
    height: 50.0,
    decoration: BoxDecoration(
      color: Color(0x552B2B2B),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
    child: CustomPaint(
      painter: TabIndicationPainter(pageController: _pageController),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pushNamed('/NotificationNews');
              },
              child: Text(
                "Notification",
                style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
            ),
          ),
          //Container(height: 33.0, width: 1.0, color: Colors.white),
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pushNamed('/NotificationMessage');
              },
              child: Text(
                "Inbox",
                style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: FlatButton(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   onPressed: (){Navigator.of(context).pushNamed('/NotificationNews');},
//                   child: Text(
//                     "Notification",
//                     style: Theme.of(context).textTheme.subhead,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: FlatButton(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   onPressed: (){Navigator.of(context).pushNamed('/NotificationMessage');},
//                   child: Text(
//                     "Inbox",
//                     style: Theme.of(context).textTheme.subhead,
//                   ),
//                 ),
//               ),
//             ],
//           ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.only(bottom: 10.0),
          //       child: Container(
          //         height: 3.0,
          //         width: 88.0,
          //         decoration: BoxDecoration(
          //           color: Colors.grey,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(bottom: 10.0),
          //       child: Container(
          //         height: 3.0,
          //         width: 88.0,
          //         decoration: BoxDecoration(
          //           color: Theme.of(context).primaryColor,
          //         ),
          //       ),
          //     ),
          //   ],
          // )
//         ]);
//   }
// }
