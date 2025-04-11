import 'package:flutter/material.dart';
import 'package:sunday_mall/views/auth/login/signin_with_employeeid.dart';
import 'package:sunday_mall/views/auth/login/signin_with_phone_number.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../../widgets/gradient_button.dart';
import '../../forgotpassword/email_verification.dart';
import '../../screens/bottom_nav_bar.dart';
import '../../screens/home_screen.dart';
import '../signup/signup_screen.dart';

class SigninWithEmail extends StatefulWidget {
  const SigninWithEmail({super.key});

  @override
  State<SigninWithEmail> createState() => _SigninWithEmailState();
}

class _SigninWithEmailState extends State<SigninWithEmail> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Hey! Welcome Back',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Sign in to my account',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  CustomInputField(
                    label: 'Email',
                    hintText: 'My Email',
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomInputField(
                    label: 'Password',
                    hintText: 'My Password',
                    prefixIcon: Icons.lock_outline,
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    showSuffixIcon: true,
                    toggleObscure: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const Text("Remember Me"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(32)),
                            ),
                            builder: (context) =>
                                ForgotPasswordEmailVerifyScreeen(),
                          );
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    // child: GradientButton(
                    //   text: 'Sign In',
                    //   gradientColors: const [
                    //     Color(0xFF3A3CF5),
                    //     Color(0xFF6367F5)
                    //   ],
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       print("Email: ${emailController.text}");
                    //       print("Password: ${passwordController.text}");
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(content: Text("Login successful!")),
                    //       );
                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => MainPage()),
                    //       );
                    //     }
                    //   },
                    // ),
                    child: GradientButton(
                      text: 'Sign in',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _socialLoginButton(
                    imagePath: 'assets/images/apple.png',
                    label: "Sign in With Employee ID",
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        builder: (context) => const SigninWithEmployeeId(),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _socialLoginButton(
                    imagePath: 'assets/images/phone.png',
                    label: "Sign in With Phone",
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        builder: (context) => const SigninWithPhoneNumber(),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "Sign Up Here",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _socialLoginButton({
    required String label,
    required VoidCallback onTap,
    required String imagePath,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
