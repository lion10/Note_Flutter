import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {

  final String noteId ;
  NoteModify({this.noteId});

  bool get isEditing => noteId != null ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note': 'Create Note'),
      ),
      body: Padding(
        padding:EdgeInsets.all(12.0),
        child:  Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText:"enter title of note",
              ),
            ),
            Container(height: 8.0,),
            TextField(
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
