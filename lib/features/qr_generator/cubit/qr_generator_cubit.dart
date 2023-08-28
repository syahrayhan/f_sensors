import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'qr_generator_event.dart';
part 'qr_generator_state.dart';

class QrGeneratorCubit extends Cubit<QrGeneratorState> {
  QrGeneratorCubit() : super(const QrGeneratorState());

  void generateQrCode(String data) {
    emit(state.copyWith(qrCodeData: data));
  }
}
