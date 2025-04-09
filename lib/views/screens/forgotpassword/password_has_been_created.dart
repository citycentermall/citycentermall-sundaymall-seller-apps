import 'package:flutter/material.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_email.dart';

import '../../../widgets/gradient_button.dart';

class PasswordHasBeenCreated extends StatefulWidget {
  const PasswordHasBeenCreated({super.key});

  @override
  State<PasswordHasBeenCreated> createState() => _PasswordHasBeenCreatedState();
}

class _PasswordHasBeenCreatedState extends State<PasswordHasBeenCreated> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF0B0F4E),
      body: Stack(
        children: [
          // Blurred background overlay
          Opacity(
            opacity: 0.3,
            child: Container(
              color: Colors.black,
              width: size.width,
              height: size.height,
            ),
          ),

          // Main content
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Password Has Been Created",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Please set a new password to secure your Work Mate account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: GradientButton(
                              text: 'Sign In', textStyle: TextStyle(fontSize: 16,color: Colors.white),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
                              },),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: -35,
                    left: size.width / 2 - 35,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3649C3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
