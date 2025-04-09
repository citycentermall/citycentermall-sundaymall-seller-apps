import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_email.dart';
import 'package:sunday_mall/views/screens/auth/signup/registration_screen.dart';

import '../../../../widgets/gradient_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset("assets/images/sunday_mall.png",height: 150,),
               //const SizedBox(height: 10),
              const Text(
                "SundayMall",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Register Using Your Credentials",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 30),

              /// Email
              _buildInputField(
                controller: emailController,
                hintText: "Enter Your Email",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              /// Phone Number with Country Code
              IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'ID',
                decoration: InputDecoration(
                  hintText: '+62 0000 0000 0000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                ),
              ),
              const SizedBox(height: 16),

              /// Password
              _buildInputField(
                controller: passwordController,
                hintText: "My Password",
                icon: Icons.lock_outline,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() {
                    _obscurePassword = !_obscurePassword;
                  }),
                ),
              ),
              const SizedBox(height: 16),

              /// Confirm Password
              _buildInputField(
                controller: confirmPasswordController,
                hintText: "Confirm My Password",
                icon: Icons.lock_outline,
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  }),
                ),
              ),
              const SizedBox(height: 30),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child:  GradientButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));

                  },),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
                    },
                    child: const Text(
                      "Sign in here",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
