import 'package:flutter/material.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_employeeid.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_phone_number.dart';
import '../../../../widgets/gradient_button.dart';
import '../../forgotpassword/email_verification.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F4E),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Hey! Welcome Back',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Center(
                        child: Text(
                          'Sign in to my account',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text("Email"),
                      const SizedBox(height: 8),
                      TextFormField(
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
                        decoration: InputDecoration(
                          hintText: "My Email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Password"),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "My Password",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordEmailVerifyScreeen(),
                                ),
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
                          child: GradientButton(
                            text: 'Sign In',
                            gradientColors: [Color(0xFF3A3CF5), Color(0xFF6367F5)],
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Email: ${emailController.text}");
                                print("Password: ${passwordController.text}");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login successful!"),
                                  ),
                                );
                              }
                          },)
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
                          Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _socialLoginButton(
                        icon: Icons.apple,
                        label: "Sign in With Employee ID",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninWithEmployeeId(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      _socialLoginButton(
                        icon: Icons.phone,
                        label: "Sign in With Phone",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninWithPhoneNumber(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLoginButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.black),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
