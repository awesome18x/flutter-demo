class NoteForListing {
  String noteId;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastEditDateTime;

  NoteForListing({
    this.noteId,
    this.noteTitle,
    this.createDateTime,
    this.lastEditDateTime,
  });

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
        noteId: item['noteId'],
        noteTitle: item['noteTitle'],
        createDateTime: DateTime.parse(item['createDateTime']),
        lastEditDateTime: item['lastEditDateTime'] != null ? DateTime.parse(item['lastEditDateTime']) : null
    );
  }
}

