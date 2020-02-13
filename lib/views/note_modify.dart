import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/Service/notes_service.dart';
import 'package:note_app/models/note.dart';

class NoteModify extends StatefulWidget {

  final String noteID ;
  NoteModify({this.noteID});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}


class _NoteModifyState extends State<NoteModify> {

  bool get isEditing => widget.noteID != null;
  NotesService get noteService  => GetIt.I<NotesService>();

  String errorMessage;
  Note note;

  bool isLoading =false;


  TextEditingController titleController =  TextEditingController();
  TextEditingController contentController =  TextEditingController();


  @override
  void initState() {
    super.initState();
        setState(() {
          isLoading = true;
        });
        noteService.getNote(widget.noteID).then((response){
           setState(() {
             isLoading = false;
           });

            if(response.error){
              errorMessage = "An error occured" ;
            }
            note = response.data;
            titleController.text = note.noteTitle;
            contentController.text = note.noteContent;
     });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note': 'Create Note'),
      ),
      body:  Padding(
        padding:EdgeInsets.all(12.0),
        child: isLoading ? Center(child: CircularProgressIndicator(),) : Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText:"enter title of note",
              ),
            ),
            Container(height: 8.0,),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                hintText:"enter content of note",
              ),
            ),
            Container(height: 16.0,),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                color:Theme.of(context).primaryColorDark,
                child: Text('Submit',
                style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
