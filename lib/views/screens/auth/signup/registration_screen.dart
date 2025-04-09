import 'package:flutter/material.dart';
import 'package:sunday_mall/views/screens/auth/login/signin_with_email.dart';
import 'package:sunday_mall/views/screens/auth/signup/send_email_otp.dart';
import 'package:sunday_mall/views/screens/auth/signup/tearms_and_condition.dart';

import '../../../../widgets/gradient_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.04),
              Image.asset("assets/images/sunday_mall.png",height: 150,),
             // Icon(Icons.shopping_bag_outlined, size: 60, color: Colors.deepPurple),
              SizedBox(height: height * 0.02),
              const Text(
                'SundayMall',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),

              const Text(
                'Register Using Your Credentials',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: height * 0.04),

              _buildDropdown(label: 'Business Type', icon: Icons.business),
              SizedBox(height: height * 0.02),

              _buildTextField(label: 'GST No', prefixIcon: Icons.confirmation_num_outlined),
              SizedBox(height: height * 0.02),

              _buildTextField(label: 'Address', prefixIcon: Icons.location_on),
              SizedBox(height: height * 0.02),

              _buildDropdown(label: 'Choose Your State', icon: Icons.map_outlined),
              SizedBox(height: height * 0.02),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(label: 'Pincode', prefixIcon: Icons.pin_drop_outlined),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(label: 'City', prefixIcon: Icons.location_city_outlined),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => TermsConditionsPopup(
                          onAgree: () {
                            setState(() {
                              isChecked = true;
                            });
                            Navigator.pop(context);
                          },
                        ),

                      );
                      setState(() {
                        isChecked = value!;
                      });
                    },

                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: 'I agree with ',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions ',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: height * 0.02),

              // Gradient Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  GradientButton(
                  text: 'Sign Up',textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => SendEmailOtp(),
                    );
                  },),
              ),
              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TextStyle(fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
                    },
                    child: const Text(
                      'Sign in here',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, IconData? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildDropdown({String label = 'Select', IconData? icon = Icons.arrow_drop_down}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: const [
        DropdownMenuItem(value: 'Retailer', child: Text('Retailer')),
        DropdownMenuItem(value: 'Distributor', child: Text('Distributor')),
        DropdownMenuItem(value: 'Wholesale', child: Text('Wholesale')),
      ],
      onChanged: (value) {},
    );
  }
}
