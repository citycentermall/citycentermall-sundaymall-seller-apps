import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_email.dart';
import 'package:sunday_mall/views/screens/auth/signup/registration_screen.dart';
import '../../../../widgets/custom_input_field.dart';
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

  late Country selectedCountry;

  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    selectedCountry = Country.parse('IN'); // Default to India
  }

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
              Image.asset("assets/images/sunday_mall.png", height: 150),
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

              CustomInputField(
                label: 'Enter Your Email',
                hintText: 'Enter Your Email',
                prefixIcon: Icons.email,
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

              // Row(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         showCountryPicker(
              //           context: context,
              //           showPhoneCode: true,
              //           onSelect: (Country country) {
              //             setState(() {
              //               selectedCountry = country;
              //             });
              //           },
              //         );
              //       },
              //       child: Row(
              //         children: [
              //           Text(
              //             "+${selectedCountry.phoneCode}",
              //             style: const TextStyle(fontSize: 16),
              //           ),
              //           const Icon(Icons.arrow_drop_down),
              //         ],
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     Expanded(
              //       child: TextFormField(
              //         controller: phoneController,
              //         decoration: const InputDecoration(
              //           hintText: "Enter Phone Number",
              //           border: InputBorder.none,
              //           counterText: '',
              //         ),
              //         keyboardType: TextInputType.phone,
              //         maxLength: 10,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Enter phone number';
              //           } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
              //             return 'Phone number must be 10 digits';
              //           }
              //           return null;
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              const SizedBox(height: 16),
              CustomInputField(
                label: 'Password',
                hintText: 'My Password',
                prefixIcon: Icons.lock_outline,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                obscureText: _obscurePassword,
                showSuffixIcon: true,
                toggleObscure: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 16),

              CustomInputField(
                label: 'Confirm Password',
                hintText: 'Confirm My Password',
                prefixIcon: Icons.lock_outline,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                obscureText: _obscureConfirmPassword,
                showSuffixIcon: true,
                toggleObscure: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: GradientButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ));
                  },
                ),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SigninWithEmail(),
                      ));
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
}
