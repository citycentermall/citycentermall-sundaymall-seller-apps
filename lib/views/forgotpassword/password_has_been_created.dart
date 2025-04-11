import 'package:flutter/material.dart';
import '../../../widgets/gradient_button.dart';
import '../auth/login/signin_with_email.dart';

class PasswordHasBeenCreated extends StatelessWidget {
  PasswordHasBeenCreated({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    const iconHeight = 64.0;
    const halfIconHeight = iconHeight / 2;

    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(height: size.height * 0.40),
            Container(
              width: double.infinity,
              height: size.height * 0.50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
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
                                Navigator.pop(context);
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                                  ),
                                  builder: (context) =>  SigninWithEmail(),
                                );
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
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
                      width: 80,
                      height: 80,
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
                      child: Image.asset("assets/images/securety.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
