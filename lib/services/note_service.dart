import 'dart:convert';

import 'package:call_api/models/api_response.dart';
import 'package:call_api/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NoteService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {
    'apiKey': '08d771e2-7c49-1789-32aff09f1471'
  };


  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          final notes = <NoteForListing>[];
          for (var item in jsonData) {
            notes.add(NoteForListing.fromJson(item));
          }
          return APIResponse<List<NoteForListing>>(data: notes);
        }
        return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
      })
      .catchError(
            (_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured')
      );

  }

  // Future<APIResponse<Note>> getNote(String noteId) {
  //
  // }
}
