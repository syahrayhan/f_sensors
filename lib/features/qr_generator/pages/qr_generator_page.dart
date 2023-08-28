import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/widgets/filled_button_widget.dart';
import 'package:flutter_sensor/core/widgets/menu/nav_drawer.dart';
import 'package:flutter_sensor/core/widgets/text_field_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../cubit/qr_generator_cubit.dart';

class QrGeneratorPage extends StatelessWidget {
  const QrGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrGeneratorCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          drawer: const NavDrawer(),
          appBar: AppBar(
            title: const Text("Qr Code Generator"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const _FormGenerator(),
                  BlocBuilder<QrGeneratorCubit, QrGeneratorState>(
                    builder: (context, state) {
                      if (state.qrCodeData.isNotEmpty) {
                        return QrImageView(
                          data: state.qrCodeData,
                          version: QrVersions.auto,
                          size: 200.0,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormGenerator extends StatefulWidget {
  const _FormGenerator();

  @override
  State<_FormGenerator> createState() => _FormGeneratorState();
}

class _FormGeneratorState extends State<_FormGenerator> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrCodeCubit = context.read<QrGeneratorCubit>();

    return Column(
      children: [
        TextFieldWidget(
          controller: _textController,
          hintText: "Input text",
        ),
        const SizedBox(height: 12),
        FilledButtonWidget(
          onPressed: () {
            final data = _textController.text;
            qrCodeCubit.generateQrCode(data);
          },
          text: "Generate QR",
        ),
      ],
    );
  }
}
