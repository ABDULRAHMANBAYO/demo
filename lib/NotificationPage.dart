import 'package:demo/bottomBar.dart';
import 'package:demo/model/message.dart';
import 'package:demo/model/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => new _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List messages;
  List allNews;

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white,
          title: Text("Notifications", style: TextStyle(color: Colors.black)),
          leading: Icon(
            FontAwesomeIcons.list,
            color: Colors.black,
          )),
      body: NotificationListener<OverscrollIndicatorNotification>(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context),
                ),
                _underLine(context),
                Expanded(
                  flex: 1,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.pink;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.pink;
                          left = Colors.black;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _notificationNews(context),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _notificationInbox(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    messages = getMessages();
    allNews = getNews();
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  Widget _buildMenuBar(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomPaint(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: FlatButton(
                        padding: const EdgeInsets.only(top: 5.0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: _onSignInButtonPress,
                        child: Center(
                          child: Text(
                            "NOTIFICATIONS",
                            style: TextStyle(
                                color: left,
                                fontSize: 13.0,
                                fontFamily: "WorkSansSemiBold"),
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: FlatButton(
                      padding: const EdgeInsets.only(top: 5.0),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: _onInboxButtonpress,
                      child: new Center(
                        child: Text(
                          "INBOX",
                          style: TextStyle(
                              color: right,
                              fontSize: 13.0,
                              fontFamily: "WorkSansSemiBold"),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ]);
  }

  Widget _underLine(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomPaint(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 3.0,
                  width: 210.0,
                  decoration: BoxDecoration(
                    color: left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 3.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: right,
                  ),
                ),
              ),
            ],
          ))
        ]);
  }

  Widget _notificationNews(BuildContext context) {
    //Create ListTile for messages
    ListTile makeListTile(News news) => ListTile(
          leading: new CircleAvatar(
            backgroundImage: AssetImage(news.image),
          ),
          title: Text(
            news.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(news.desc, style: TextStyle(color: Colors.black)),
          trailing: new Row(mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                news.desc.contains("following")
                    ? new RaisedButton(
                        onPressed: () {},
                        child: new Text(
                          "Follow",
                          style: new TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        color: Colors.pink,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                      )
                    : Image.asset(
                        news.trailing,
                        height: 30,
                      )
              ]),
          isThreeLine: true,
        );
    final makeBody = SingleChildScrollView(
        child: Container(
            child: Column(children: <Widget>[
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: allNews.length,
        itemBuilder: (BuildContext context, int index) {
          return makeListTile(allNews[index]);
        },
      ),
    ])));
    return makeBody;
  }

  Widget _notificationInbox(BuildContext context) {
    //Create ListTile for messages
    ListTile makeListTile(Message message) => ListTile(
          leading: new CircleAvatar(
            backgroundImage: AssetImage(message.image),
          ),
          title: Text(
            message.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(message.desc, style: TextStyle(color: Colors.black)),
          trailing: Text(
            message.timeStap,
            style: TextStyle(color: Colors.black),
          ),
        );
    final makeBody = Container(
        child: Column(children: <Widget>[
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return makeListTile(messages[index]);
        },
      ),
    ]));
    return makeBody;
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onInboxButtonpress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
