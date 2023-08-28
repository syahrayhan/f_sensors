part of 'qr_generator_cubit.dart';

sealed class QrGeneratorEvent extends Equatable {
  const QrGeneratorEvent();

  @override
  List<Object> get props => [];
}

class GenerateQrCode extends QrGeneratorEvent {
  final String data;

  const GenerateQrCode(this.data);

  @override
  List<Object> get props => [data];
}
