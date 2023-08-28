import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/features/home/pages/home_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SignInQrScanPage extends StatefulWidget {
  const SignInQrScanPage({super.key});

  @override
  State<SignInQrScanPage> createState() => _SignInQrScanPageState();
}

class _SignInQrScanPageState extends State<SignInQrScanPage> {
  QRViewController? controller;
  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In With QR CODE"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                _onQRViewCreated(context, controller);
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: Text('Place the QR code in the camera view to Sign In.'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(BuildContext context, QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      HapticFeedback.heavyImpact();
      if (scanData.code != null) {
        this.controller!.pauseCamera();
        PageRoutes.pushAndRemoveUntil(() => const HomePage());
      }
    });
  }
}
