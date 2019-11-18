class NoteB {
  int id;
  String name, desc, date;

  NoteB(this.id, this.name, this.desc, this.date);
}

List getNoteB() {
  return [
    NoteB(4, 'Health check up.pdf', 
    'Document, small file', 'Mar 13,2019',),
    NoteB(5, 'IMG_89998.jpeg', 'Picture,large file', 'Mar 13,2019'),
    NoteB(6, 'IMG_82922.jpg', 'Document, small file', 'Mar 13,2019'),
  ];
}
