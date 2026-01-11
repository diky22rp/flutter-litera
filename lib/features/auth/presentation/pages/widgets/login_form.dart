import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/utils/app_validator.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  // Rive variables
  StateMachineController? _stateMachineController;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsup, isChecking;
  SMINumber? numLook;

  void _onRiveInit(Artboard artboard) {
    debugPrint("--- RIVE DEBUG: Artboard Loaded ---");

    final controller =
        StateMachineController.fromArtboard(artboard, 'Login Machine') ??
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    if (controller != null) {
      artboard.addController(controller);
      _stateMachineController = controller;
      debugPrint("--- RIVE DEBUG: State Machine Controller Found ---");

      // Menelusuri semua input yang tersedia di file .riv tersebut
      for (var element in controller.inputs) {
        debugPrint(
          "Input Name: ${element.name} | Type: ${element.runtimeType}",
        );

        if (element.name == "trigSuccess") {
          successTrigger = element as SMITrigger;
        }
        if (element.name == "trigFail") {
          failTrigger = element as SMITrigger;
        }
        if (element.name == "isChecking") {
          isChecking = element as SMIBool;
        }
        if (element.name == "isHandsUp") {
          isHandsup = element as SMIBool;
        }
        if (element.name == "numLook") {
          numLook = element as SMINumber;
        }
      }
    } else {
      debugPrint("--- RIVE ERROR: State Machine NOT FOUND! ---");
      debugPrint(
        "Pastikan nama State Machine di Editor Rive adalah 'Login Machine'",
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _stateMachineController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_, __) {
            debugPrint("Login Success: Firing Success Animation");
            successTrigger?.fire();
          },
          error: (message) {
            debugPrint("Login Error: Firing Fail Animation");
            failTrigger?.fire();
          },
          orElse: () {},
        );
      },
      child: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ANIMASI RIVE DENGAN DEBUG PLACEHOLDER
                SizedBox(
                  height: 250,
                  child: RiveAnimation.asset(
                    'assets/login-animation.riv',
                    fit: BoxFit.contain,
                    onInit: _onRiveInit,
                    placeHolder: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text("Loading..."),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  "Welcome to Litera",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                // EMAIL FIELD
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onTap: () => isChecking?.value = true,
                  onChanged: (value) {
                    numLook?.value = value.length.toDouble();
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: AppValidator.validateEmail,
                ),
                const SizedBox(height: 16),

                // PASSWORD FIELD
                Focus(
                  onFocusChange: (hasFocus) {
                    debugPrint("Password Focus: $hasFocus");
                    isHandsup?.value = hasFocus;
                    isChecking?.value = false;
                  },
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    validator: (val) => (val == null || val.isEmpty)
                        ? "Password wajib diisi"
                        : null,
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      debugPrint(
                        "Submit Login: Email ${_emailController.text}",
                      );

                      context.read<AuthBloc>().add(
                        AuthEvent.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.pushNamed('register'),
                  child: const Text("Belum punya akun? Daftar disini"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
