import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/Service/notes_service.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:note_app/views/note_delete.dart';
import 'package:note_app/views/note_modify.dart';


class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  NotesService get service => GetIt.instance<NotesService>();
  List<NoteForListing> notes = [];

  @override
  void initState(){
    notes = service.getNoteList();
    super.initState();
  }

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
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> NoteModify()));
        },
        child: Icon(Icons.add),
      ),

      body: ListView.separated(
        itemCount: notes.length,
        itemBuilder: (_,index){
          return Dismissible(
            key: ValueKey(notes[index].noteId),
            direction: DismissDirection.startToEnd,

            confirmDismiss: (direction) async{
              final result = await showDialog(
                  context: context,
                  builder: (_) => NoteDelete());
              return result;
            },
            onDismissed:(direction){

            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16.0),
              child: Align(child: Icon(Icons.delete,color: Colors.white,),alignment: Alignment.centerLeft,),
            ),

            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
              subtitle: Text('Last edited on ${formatDateTime(notes[index].latestEditedDateTime)}'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NoteModify(noteId: notes[index].noteId,) ));
              },
            ),
          );
        },
        separatorBuilder: (_,__) => Divider(height: 2,color: Colors.blue,),
      ),
    );
  }
}
