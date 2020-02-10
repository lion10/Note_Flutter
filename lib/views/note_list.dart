import 'package:flutter/material.dart';
import 'package:note_app/models/note_for_listing.dart';


class NoteList extends StatelessWidget {

  final notes =[
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

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("List of Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),

      body: ListView.separated(
        itemCount: notes.length,
        itemBuilder: (_,index){
          return ListTile(
            title: Text(
              notes[index].noteTitle,
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            subtitle: Text('Last edited on ${formatDateTime(notes[index].latestEditedDateTime)}'),
          );
        },
        separatorBuilder: (_,__) => Divider(height: 2,color: Colors.blue,),
      ),
    );
  }
}
