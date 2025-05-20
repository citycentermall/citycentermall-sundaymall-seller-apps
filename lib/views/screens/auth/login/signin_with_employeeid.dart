import 'package:flutter/material.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_email.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_phone_number.dart';
import '../../forgotpassword/email_verification.dart';

class SigninWithEmployeeId extends StatefulWidget {
  const SigninWithEmployeeId({super.key});

  @override
  State<SigninWithEmployeeId> createState() => _SigninWithEmployeeIdState();
}

class _SigninWithEmployeeIdState extends State<SigninWithEmployeeId> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        'Sign In to my account',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text("Employee Id"),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "My Employee Id",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text("Password"),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: "My Password",
                        hintStyle: TextStyle(color: Colors.grey),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordEmailVerifyScreeen(),));
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
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3A3CF5), Color(0xFF6367F5)],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Text("OR",style: TextStyle(color: Colors.grey),),
                        ),
                        Expanded(child: Divider(color: Colors.grey),),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _socialLoginButton(
                      icon: Icons.email_outlined,
                      label: "Sign in with Email",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
                      },
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {

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
