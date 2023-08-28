import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/features/home/pages/home_page.dart';
import 'package:flutter_sensor/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_sensor/features/sign_in/pages/sign_in_qr_scan_page.dart';

import '../../../core/helpers/loading_dialog_helper.dart';
import '../../../core/widgets/filled_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../core/widgets/text_field_widget.dart';
import '../../sign_up/pages/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: width,
              height: height * 0.3,
              child: Image.asset(
                "assets/bg_welcome.jpg",
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(top: height * 0.28),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const _LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFingerPrintNotSupport) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Fingerprint not support"),
            ),
          );
        }
        if (state is SignInNFCStanBy) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Bring the card to the back of the smartphone"),
            ),
          );
        }
        if (state is SignInNFCNotSupport) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("NFC not support"),
            ),
          );
        }
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height - (height * 0.28),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  "Sign In to Sensors",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const _SignInWithEmailForm(),
            const Text("Or Sign In With"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _signInUsingFingerprint(context),
                _signInUsingQr(context),
                _signInUsingNfc(context),
              ],
            ),
            _signUpButton(context),
          ],
        ),
      ),
    );
  }

  Widget _signInUsingNfc(BuildContext context) {
    return IconButtonWidget(
      onPressed: () async {
        context.read<SignInBloc>().add(SignInWithNFC());
      },
      icon: const Icon(Icons.nfc),
    );
  }

  Widget _signInUsingQr(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        PageRoutes.push(() => const SignInQrScanPage());
      },
      icon: const Icon(Icons.qr_code),
    );
  }

  Widget _signInUsingFingerprint(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        context.read<SignInBloc>().add(SignInWithFingerPrint());
      },
      icon: const Icon(Icons.fingerprint),
    );
  }

  TextButton _signUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        PageRoutes.push(SignUpPage.new);
      },
      child: const Text(
        "Don't have an account ? Sign Up",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _SignInWithEmailForm extends StatefulWidget {
  const _SignInWithEmailForm();

  @override
  State<_SignInWithEmailForm> createState() => __SignInWithEmailFormState();
}

class __SignInWithEmailFormState extends State<_SignInWithEmailForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordHide = true;

  @override
  void initState() {
    context.read<SignInBloc>().add(SignInEventReset());
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          LoadingDialogHelper.hideLoadingDialog(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Congratulation Sign In to Sensors success"),
            ),
          );
          PageRoutes.pushAndRemoveUntil(() => const HomePage());
        }

        if (state is SignInLoading) {
          LoadingDialogHelper.showLoadingDialog(context);
        }

        if (state is SignInFail) {
          LoadingDialogHelper.hideLoadingDialog(context);
        }
      },
      child: Column(
        children: [
          TextFieldWidget(
            hintText: "Email",
            label: "Email",
            textInputAction: TextInputAction.next,
            controller: _emailController,
          ),
          const SizedBox(height: 12),
          TextFieldWidget(
            hintText: "Password",
            label: "Password",
            textInputAction: TextInputAction.done,
            hidePassword: isPasswordHide,
            controller: _passwordController,
            suffixIcon: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  isPasswordHide = !isPasswordHide;
                });
              },
              iconSize: 10,
              icon: Icon(
                isPasswordHide ? Icons.visibility_off : Icons.visibility,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const _ErrorMessage(),
          FilledButtonWidget(
            onPressed: () {
              context.read<SignInBloc>().add(
                    SignInWithEmailSubmmited(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
            },
            text: "Sign In",
          ),
        ],
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInFail) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.message,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
