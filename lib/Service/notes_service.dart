
import 'package:note_app/models/note_for_listing.dart';

class NotesService{

  List<NoteForListing> getNoteList(){
    return [
      new NoteForListing(
          noteId: "1",
          noteTitle: "Note 1",
          createDateTime: DateTime.now(),
          latestEditedDateTime: DateTime.now()
      ),
      new NoteForListing(
          noteId: "2",
          noteTitle: "Note 2",
          createDateTime: DateTime.now(),
          latestEditedDateTime: DateTime.now()
      ),
      new NoteForListing(
          noteId: "3",
          noteTitle: "Note 3",
          createDateTime: DateTime.now(),
          latestEditedDateTime: DateTime.now()
      ),
    ];
  }
}