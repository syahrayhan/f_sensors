import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/loading_dialog_helper.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/features/home/pages/home_page.dart';

import '../../../core/widgets/filled_button_widget.dart';
import '../../../core/widgets/text_field_widget.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.3,
              color: Theme.of(context).primaryColor,
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height - (height * 0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            children: [
              Text(
                "Sign Up to Sensors",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const _FormSignUpWithEmail(),
          _haveAccountButton(context),
        ],
      ),
    );
  }

  TextButton _haveAccountButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        "Have an account ? Sign In",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _FormSignUpWithEmail extends StatefulWidget {
  const _FormSignUpWithEmail();

  @override
  State<_FormSignUpWithEmail> createState() => __FormSignUpWithEmailState();
}

class __FormSignUpWithEmailState extends State<_FormSignUpWithEmail> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordHide = true;

  @override
  void initState() {
    context.read<SignUpBloc>().add(SignUpEventReset());
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
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          LoadingDialogHelper.hideLoadingDialog(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Congratulation Sign Up to Sensors success"),
            ),
          );
          PageRoutes.pushAndRemoveUntil(() => const HomePage());
        }

        if (state is SignUpLoading) {
          LoadingDialogHelper.showLoadingDialog(context);
        }

        if (state is SignUpFail) {
          LoadingDialogHelper.hideLoadingDialog(context);
        }
      },
      child: Column(
        children: [
          TextFieldWidget(
            hintText: "Email",
            label: "Email",
            controller: _emailController,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextFieldWidget(
            hintText: "Password",
            label: "Password",
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            hidePassword: isPasswordHide,
            suffixIcon: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  isPasswordHide = !isPasswordHide;
                });
              },
              iconSize: 10,
              icon: const Icon(
                Icons.visibility_off,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const _ErrorMessage(),
          FilledButtonWidget(
            onPressed: () {
              context.read<SignUpBloc>().add(
                    SignUpWithEmailSubmmited(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
            },
            text: "Sign Up",
          )
        ],
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpFail) {
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
