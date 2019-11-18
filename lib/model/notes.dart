import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notes {
  int id;
  String name, desc, date;

  Notes(this.id, this.name, this.desc, this.date,);
}

List getNotes() {
  return [
    Notes(1, 'Health check follow up', 'Document, small file', 'Mar 13,2019'),
    Notes(2, 'Health check up', 'Document, small file', 'Mar 13,2019',),
    Notes(3, 'Health check up.doc', 'Document, small file', 'Mar 13,2019',),
  ];
}
