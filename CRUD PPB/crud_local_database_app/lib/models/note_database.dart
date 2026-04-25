import 'package:crud_local_database_app/models/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// CONTROLLER (C in MVC)
// Manages all database operations and notifies listeners on changes.
// Acts as the intermediary between the Model (Note) and the View (NotesPage).
class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  // INIT
  // Initialize Isar database at the appropriate directory for the platform
  static Future<void> initialize() async {
    if (Platform.isAndroid) {
      // Use application documents directory on Android
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open([NoteSchema], directory: dir.path);
    } else {
      // Use temporary directory on other platforms
      final dir = getTemporaryDirectory();
      isar = await Isar.open([NoteSchema], directory: (await dir).path);
    }
  }

  // list — holds the current notes displayed in the View
  final List<Note> currentNotes = [];

  // CREATE — adds a new note to the database
  Future<void> addNote(String textFromUser) async {
    // create a new note object
    final newNote = Note()..text = textFromUser;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-read from db to update the list
    fetchNotes();
  }

  // READ — fetches all notes from the database into currentNotes
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners(); // notify View to rebuild
  }

  // UPDATE — updates an existing note's text by id
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // DELETE — removes a note from the database by id
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}