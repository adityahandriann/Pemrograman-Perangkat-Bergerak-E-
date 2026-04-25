// VIEW (V in MVC)
// Displays the list of notes and provides UI for CRUD operations.
// Communicates with NoteDatabase (Controller) via Provider.

import 'package:crud_local_database_app/models/note.dart';
import 'package:crud_local_database_app/models/note_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller to access what the user typed
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // CREATE — shows dialog to add a new note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create Note"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter note text"),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // send text to Controller to add to db
              context.read<NoteDatabase>().addNote(textController.text);

              // clear controller
              textController.clear();

              Navigator.pop(context);
            },
            child: const Text("Create"),
          )
        ],
      ),
    );
  }

  // READ — fetch notes from the Controller (NoteDatabase)
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // UPDATE — shows dialog to edit an existing note
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Update Note"),
              content: TextField(controller: textController),
              actions: [
                MaterialButton(
                    onPressed: () {
                      // send updated text to Controller
                      context
                          .read<NoteDatabase>()
                          .updateNote(note.id, textController.text);
                      // clear controller
                      textController.clear();

                      Navigator.pop(context);
                    },
                    child: const Text("Update"))
              ],
            ));
  }

  // DELETE — instructs Controller to remove the note by id
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // watch NoteDatabase (Controller) for changes
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes from Controller
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
        appBar: AppBar(title: const Text('Notes')),
        floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, index) {
            // get individual note from the list
            final note = currentNotes[index];

            // list tile UI for each note
            return ListTile(
              title: Text(note.text),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // edit button
                  IconButton(
                      onPressed: () => updateNote(note),
                      icon: const Icon(Icons.edit)),
                  // delete button
                  IconButton(
                      onPressed: () => deleteNote(note.id),
                      icon: const Icon(Icons.delete))
                ],
              ),
            );
          },
        ));
  }
}