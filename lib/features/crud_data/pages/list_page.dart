import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/core/widgets/filled_button_widget.dart';
import 'package:flutter_sensor/core/widgets/menu/nav_drawer.dart';
import 'package:flutter_sensor/features/crud_data/bloc/crud_bloc.dart';
import 'package:flutter_sensor/features/crud_data/pages/add_page.dart';
import 'package:flutter_sensor/features/crud_data/pages/edit_page.dart';

class ListPages extends StatefulWidget {
  const ListPages({super.key});

  @override
  State<ListPages> createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<CrudBloc>().add(LoadNotes());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text("CRUD Sqflite"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BlocBuilder<CrudBloc, CrudState>(
              builder: (context, state) {
                final notes = state.notes;

                if (notes.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text("Add Data First"),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: ListTile(
                              title: Text(note.text),
                              subtitle: Text('${note.date} ${note.time}'),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      if (note.id == null) return;
                                      PageRoutes.push(
                                        () => EditPage(
                                          note: note,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      if (note.id == null) return;
                                      context.read<CrudBloc>().add(
                                            DeleteNoteById(
                                              note.id!,
                                            ),
                                          );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            FilledButtonWidget(
              onPressed: () {
                PageRoutes.push(() => const AddPage());
              },
              text: "Add Data",
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
