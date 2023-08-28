import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sensor/core/domain/usecases/sign_in_with_email.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../core/helpers/fingerprint_helper.dart';
import '../../../core/utils/text_validator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithEmail signInWithEmail;
  final FingerprintHelper _fingerprintHelper = FingerprintHelper();
  final NfcManager nfcManager = NfcManager.instance;

  SignInBloc({required this.signInWithEmail}) : super(SignInInitial()) {
    on<SignInEventReset>((event, emit) => emit(SignInInitial()));
    on<SignInWithEmailSubmmited>((event, emit) async {
      final email = event.email ?? '';
      final password = event.password ?? '';

      emit(SignInLoading());

      if (!TextValidator.isEmailValid(email)) {
        return emit(const SignInFail(message: "Email Invalid"));
      }

      if (password.length < 3) {
        return emit(
          const SignInFail(message: "Password can't empty"),
        );
      }

      final result = await signInWithEmail.execute(email, password);

      result.fold((fail) {
        emit(SignInFail(message: fail.toString()));
      }, (r) {
        emit(SignInSuccess());
      });
    });

    on<SignInWithFingerPrint>((event, emit) async {
      if (await _fingerprintHelper.isDeviceSupport() == false) {
        return emit(SignInFingerPrintNotSupport());
      }

      final result = await _fingerprintHelper.authenticate();

      if (result) {
        emit(SignInSuccess());
      }
    });

    on<SignInWithNFC>((event, emit) async {
      try {
        final isSupportNFC = await nfcManager.isAvailable();

        if (!isSupportNFC) return emit(SignInNFCNotSupport());
        emit(SignInNFCStanBy());

        final completer = Completer<void>();

        await nfcManager.startSession(
          onDiscovered: (NfcTag tag) async {
            try {
              await Future.delayed(const Duration(seconds: 2));

              emit(SignInSuccess());

              await nfcManager.stopSession();
              completer.complete();
            } catch (error) {
              completer.completeError(error);
            }
          },
        );

        await completer.future;
      } catch (e) {
        nfcManager.stopSession();
      }
    });
  }
}
