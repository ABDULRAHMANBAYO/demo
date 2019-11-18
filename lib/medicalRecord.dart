import 'package:demo/bottomBar.dart';
import 'package:demo/medicalRecordAppBar.dart';
import 'package:demo/model/folderA.dart';
import 'package:demo/model/folderB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicalRecord extends StatefulWidget {
  @override
  _MedicalRecordState createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(50.0),
      ),
      body: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 53.0),
          child: Text(
            "Medical Records",
            style: TextStyle(fontSize: 25.0, fontFamily: "WorkSansSemiBold"),
            textDirection: TextDirection.ltr,
          ),
        ),
        SingleChildScrollView(
            child: Container(
          child: Column(children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, right: 10.0, left: 10.0),
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Medical Records...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 70.0, right: 10.0, left: 10.0),
                child: SingleChildScrollView(
                    child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    children: folderA
                        .map((folder) => _buildFolderACard(folder))
                        .toList(),
                  ),
                ))),
          ]),
        )),
        Positioned(
          top: 120.0,
          left: 0.0,
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.white,
            child: InkWell(
              child: Container(
                  height: 20.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: new Center(
                    child: Text("Most Recent"),
                  )),
            ),
          ),
        ),
        Positioned(
          bottom: 200.0,
          left: 0.0,
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.white,
            child: InkWell(
              child: Container(
                  height: 20.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: new Center(
                    child: Text("Last Month"),
                  )),
            ),
          ),
        ),
        Positioned(
            top: 550.0,
            child: SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children:
                    folderB.map((folder) => _buildFolderBCard(folder)).toList(),
              ),
            ))),
      ]),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildFolderACard(FolderA folderA) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Stack(
        children: <Widget>[
          //Design of the red bar on the blue bar
          Positioned(
            left: 7.0,
            child: Container(
              height: 5.0,
              width: 75.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1.0),
                  bottomRight: Radius.circular(1.0),
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              ),
            ),
          ),
          //Design And position of the blue flolder
          Positioned(
            top: 7.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.white,
              child: InkWell(
                child: Container(
                  height: 60.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          //Design and position Lock
          Positioned(
            top: 40.0,
            bottom: 50.0,
            left: 52.0,
            right: 20.0,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.lock,
                  color: Colors.grey.withOpacity(0.3),
                  size: 20,
                )
              ],
            ),
          ),
          //Design and position folder name
          Positioned(
            top: 70.0,
            // bottom: 55.0,
            //left: 20.0,
            right: 20.0,
            child: Container(
              height: 50.0,
              width: 90.0,
              child: Text(folderA.name,
                  style: TextStyle(
                      fontSize: 12.0, fontFamily: "WorkSansSemiBold")),
            ),
          ),
          Positioned(
            top: 100.0,
            child: Container(
                height: 30.0,
                width: 90.0,
                child: Center(
                  child: Text(folderA.date,
                      style: TextStyle(
                          fontSize: 12.0, fontFamily: "WorkSansSemiBold")),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildFolderBCard(FolderB folderB) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Stack(
        children: <Widget>[
          //Design of the red bar on the blue bar
          Positioned(
            left: 7.0,
            child: Container(
              height: 5.0,
              width: 75.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1.0),
                  bottomRight: Radius.circular(1.0),
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              ),
            ),
          ),
          //Design And position of the blue flolder
          Positioned(
            top: 7.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.white,
              child: InkWell(
                child: Container(
                  height: 60.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          //Design and position Lock
          Positioned(
            top: 40.0,
            bottom: 50.0,
            left: 52.0,
            right: 20.0,
            child: Column(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.lock,
                  color: Colors.grey.withOpacity(0.3),
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
