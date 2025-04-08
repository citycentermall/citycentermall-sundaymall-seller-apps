import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_email.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_employeeid.dart';
import '../../forgotpassword/email_verification.dart';
import 'otp_verification.dart';

class SigninWithPhoneNumber extends StatefulWidget {
  const SigninWithPhoneNumber({super.key});

  @override
  State<SigninWithPhoneNumber> createState() => _SigninWithPhoneNumberState();
}

class _SigninWithPhoneNumberState extends State<SigninWithPhoneNumber> {
  Country selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: '9123456789',
    displayName: 'India',
    displayNameNoCountryCode: 'India',
    e164Key: '',
  );

  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F4E),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          "Sign in to my account",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 24),

                      const Text("Phone Number"),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    setState(() {
                                      selectedCountry = country;
                                    });
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "+${selectedCountry.phoneCode}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: phoneController,
                                decoration: const InputDecoration(
                                  hintText: "Enter Phone Number",
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter phone number';
                                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                    return 'Phone number must be 10 digits';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (val) {},
                                activeColor: Colors.deepPurple,
                              ),
                              const Text("Remember Me"),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder:  (context) => ForgotPasswordEmailVerifyScreeen(),));
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final fullNumber =
                                  "+${selectedCountry.phoneCode}${phoneController.text}";
                              print("Logging in with: $fullNumber");

                              // ✅ Navigate to OTP screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>  OtpVerificationScreen(phoneNumber: "+91XXXXXXXXXX"),
                                ),
                              );
                            }
                          },
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
                            child: const Center(
                              child: Text(
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
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("OR"),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      _outlinedLoginButton(
                        icon: Icons.badge,
                        label: "Sign in With Employee ID",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmployeeId(),));
                        },
                      ),
                      const SizedBox(height: 12),
                      _outlinedLoginButton(
                        icon: Icons.email_outlined,
                        label: "Sign in With Email",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
                        },
                      ),

                      const SizedBox(height: 24),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text.rich(
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: TextStyle(color: Colors.black),
                              children: [
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlinedLoginButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.deepPurple),
        label: Text(
          label,
          style: const TextStyle(color: Colors.deepPurple),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.deepPurple),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
