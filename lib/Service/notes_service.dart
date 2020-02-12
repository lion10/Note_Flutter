
import 'dart:convert';

import 'package:note_app/models/api_response.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService{

  static const API  ='http://api.notes.programmingaddict.com';
  static const Headers = {"apiKey": "08d7aeca-086f-1f17-4d05-95beda7a1e45"};

  Future<ApiResponse<List<NoteForListing>>> getNoteList() async{
    return http.get(API+'/notes',headers: Headers).
    then((data){
          if (data.statusCode == 200){
              final jsonData  =json.decode(data.body);
              final notes = <NoteForListing>[];
                for(var item in jsonData){
                  final note = NoteForListing(
                      noteId: item['noteID'] ,
                      noteTitle:item['noteTitle'],
                      createDateTime:DateTime.parse(item['createDateTime']) ,
                      latestEditedDateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']) : null);

                  notes.add(note);
                }
                return ApiResponse<List<NoteForListing>>(data: notes);
            }
          return ApiResponse<List<NoteForListing>>(error: true , errorMessage: "An Error Is Occured");
    }).catchError((_){
      return ApiResponse<List<NoteForListing>>(error: true , errorMessage: "An Error Is Occured");
    });

  }
}