
import 'dart:convert';

import 'package:note_app/models/api_response.dart';
import 'package:note_app/models/insert_note.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService{

  static const API  ='http://api.notes.programmingaddict.com';
  static const Headers = {
    "apiKey": "08d7b098-cf67-a54e-c529-7018f7bf40d1",
    "Content-Type" :"application/json"
  };


  // for list of items
  Future<ApiResponse<List<NoteForListing>>> getNoteList() async{
    return http.get(API+'/notes',headers: Headers).
    then((data){
          if (data.statusCode == 200){
              final jsonData  =json.decode(data.body);
              final notes = <NoteForListing>[];
                for(var item in jsonData){
                  notes.add(NoteForListing.fromJson(item));
                }
                return ApiResponse<List<NoteForListing>>(data: notes);
            }
          return ApiResponse<List<NoteForListing>>(error: true , errorMessage: "An Error Is Occured");
    }).catchError((_){
      return ApiResponse<List<NoteForListing>>(error: true , errorMessage: "An Error Is Occured");
    });
  }


  // for one item only
  Future<ApiResponse<Note>> getNote(String noteID) async {
    return http.get(API + '/notes/' + noteID, headers: Headers).
    then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        return ApiResponse<Note>(data: Note.fromJson(jsonData));
      }
      return ApiResponse<Note>(
          error: true, errorMessage: "An Error Is Occured");
    }).catchError((_) {
      return ApiResponse<Note>(
          error: true, errorMessage: "An Error Is Occured");
    });
  }


  Future<ApiResponse<bool>> createNote(InsertNote note) async {
    return http.post(API + '/notes', headers: Headers,body: json.encode(note.toJson())).
    then((data) {
      if (data.statusCode == 201) {
        return ApiResponse<bool>(data: true);
      }
      return ApiResponse<bool>(
          error: true, errorMessage: "An Error Is Occured");
    }).catchError((_) {
      return ApiResponse<bool>(
          error: true, errorMessage: "An Error Is Occured");
    });
  }


}