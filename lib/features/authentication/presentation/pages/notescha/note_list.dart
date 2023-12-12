

class note {
  String? id;
  String? notesText1;
  String? notesTExt2;
  bool? isDone;

  note({
    required this.id,
    required this.notesText1,
    required this.notesTExt2,
    this.isDone = false,
});

  static List<note> noteList() {
    return [
      note(id: '01', notesText1: 'Commitment resource lecture', notesTExt2: 'We explained the definition of commitment and it..'),
      note(id: '02', notesText1: 'Duas', notesTExt2: 'Allahuma aeni ealaa dikrika wa shukrika wa husn e..'),
      note(id: '03', notesText1: 'Commitment resource lecture', notesTExt2: 'We explained the definition of commitmen..', isDone: true),
      note(id: '04', notesText1: 'Commitment resource lecture', notesTExt2: 'We explained the definition of commitment and it..'),
      note(id: '05', notesText1: 'Commitment resource lecture', notesTExt2: 'We explained the definition of commitment and it..'),

    ];
  }
}