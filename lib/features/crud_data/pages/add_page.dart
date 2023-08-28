import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/widgets/filled_button_widget.dart';

import '../../../core/domain/entities/note.dart';
import '../../../core/widgets/text_field_widget.dart';
import '../bloc/crud_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _Form(),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final textEditCtrl = TextEditingController();
  final dateEditCtrl = TextEditingController();
  final timeEditCtrl = TextEditingController();

  @override
  void dispose() {
    textEditCtrl.dispose();
    dateEditCtrl.dispose();
    timeEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteBloc = context.read<CrudBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          hintText: "Text",
          label: "Text",
          textInputAction: TextInputAction.next,
          controller: textEditCtrl,
        ),
        const SizedBox(height: 10),
        TextFieldWidget(
          hintText: "Date",
          label: "Date",
          textInputAction: TextInputAction.next,
          controller: dateEditCtrl,
        ),
        const SizedBox(height: 10),
        TextFieldWidget(
          hintText: "Time",
          label: "Time",
          textInputAction: TextInputAction.next,
          controller: timeEditCtrl,
        ),
        const SizedBox(height: 14),
        FilledButtonWidget(
          onPressed: () {
            final text = textEditCtrl.text;
            final date = dateEditCtrl.text;
            final time = timeEditCtrl.text;
            if (text.isNotEmpty && date.isNotEmpty && time.isNotEmpty) {
              final newNote = Note(date: date, time: time, text: text);
              noteBloc.add(AddNote(newNote));
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("All field is required"),
                ),
              );
            }
          },
          text: "Save",
        ),
      ],
    );
  }
}
