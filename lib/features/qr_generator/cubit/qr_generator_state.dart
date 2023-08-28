part of 'qr_generator_cubit.dart';

class QrGeneratorState extends Equatable {
  const QrGeneratorState([this.qrCodeData = ""]);

  final String qrCodeData;

  QrGeneratorState copyWith({String? qrCodeData}) {
    return QrGeneratorState(qrCodeData ?? this.qrCodeData);
  }

  @override
  List<Object> get props => [qrCodeData];
}
