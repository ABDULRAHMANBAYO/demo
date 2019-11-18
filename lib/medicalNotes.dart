import 'package:demo/appBar.dart';
import 'package:demo/bottomBar.dart';
import 'package:demo/model/notes.dart';
import 'package:demo/model/notesB.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicalNote extends StatefulWidget {
  @override
  _MedicalNoteState createState() => _MedicalNoteState();
}

class _MedicalNoteState extends State<MedicalNote> {
  List allNotes;
  List allNotesB;
  @override
  void initState() {
    allNotes = getNotes();
    allNotesB = getNoteB();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Create ListTile for note
    ListTile makeListTileForNoteA(Notes note) => ListTile(
          leading: Icon(FontAwesomeIcons.file),
          title: Text(
            note.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${note.desc}' +
                '\n'
                    '${note.date}',
          ),
          trailing: Icon(Icons.more_horiz),
          isThreeLine: true,
        );
    final makeBody = SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 80.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: allNotes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return makeListTileForNoteA(allNotes[index]);
                  },
                ),
              ),
            ])));

    //Create ListTile for noteB
    ListTile makeListTileForNoteB(NoteB noteB) => ListTile(
          leading: Icon(FontAwesomeIcons.fileImage),
          title: Text(
            noteB.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${noteB.desc}' +
                '\n'
                    '${noteB.date}',
          ),
          trailing: Icon(Icons.more_horiz),
          isThreeLine: true,
        );
    final makeNoteB = SingleChildScrollView(
        child: Container(
            child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: allNotesB.length,
          itemBuilder: (BuildContext context, int index) {
            return makeListTileForNoteB(allNotesB[index]);
          },
        ),
      ),
    ])));
    // final topAppBar = AppBar(
    //     elevation: 0.1,
    //     backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    //     title: Text(
    //       "Medical Notes",
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     leading: new IconButton(
    //       icon: new Icon(
    //         Icons.arrow_back,
    //         color: Colors.black,
    //       ),
    //       onPressed: () {},
    //     )primary: false,
    //     ,actions: <Widget>[
    //       Icon(Icons.add_circle_outline,color:Colors.black ,)
    //     ],
    //     );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(50.0),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: new Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Medical Note",
                      style: TextStyle(
                          fontSize: 25.0, fontFamily: "WorkSansSemiBold"),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 120.0),
                    child: Text(
                      "Show More",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontFamily: "WorkSansSemiBold"),
                    )),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          Positioned(
            top: 75.0,
            left: 0.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.white,
              child: InkWell(
                child: Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: new Center(
                      child: Text("A"),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: makeBody,
          ),
          Positioned(
            top: 380.0,
            left: 0.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.white,
              child: InkWell(
                child: Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: new Center(
                      child: Text("B"),
                    )),
              ),
            ),
          ),
          Positioned(
              top: 320.0,
              child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: makeNoteB))),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
