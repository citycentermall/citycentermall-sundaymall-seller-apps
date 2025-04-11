import 'package:flutter/material.dart';
import 'package:sunday_mall/views/auth/signup/send_email_otp.dart';
import 'package:sunday_mall/views/auth/signup/tearms_and_condition.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../../widgets/gradient_button.dart';
import '../login/signin_with_email.dart';
import '../login/signin_with_phone_number.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.04),
                Image.asset("assets/images/sunday_mall.png", height: 150),
                SizedBox(height: height * 0.02),
                const Text('SundayMall', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text('Register Using Your Credentials', style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(height: height * 0.04),

                _buildDropdown(label: 'Business Type', icon: Icons.business),
                SizedBox(height: height * 0.02),

                CustomInputField(
                  label: 'GST No',
                  hintText: 'Enter GST No',
                  prefixIcon: Icons.confirmation_num_outlined,
                  validator: (value) => value == null || value.isEmpty ? 'Please enter your GST number' : null,
                ),
                SizedBox(height: height * 0.02),

                CustomInputField(
                  label: 'Address',
                  hintText: 'Enter Address',
                  prefixIcon: Icons.location_on,
                  validator: (value) => value == null || value.isEmpty ? 'Please enter your Address' : null,
                ),
                SizedBox(height: height * 0.02),

                _buildDropdown(label: 'Choose Your State', icon: Icons.map_outlined),
                SizedBox(height: height * 0.02),

                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        label: 'Pincode',
                        hintText: 'Enter Pincode',
                        prefixIcon: Icons.pin_drop_outlined,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your pincode' : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomInputField(
                        label: 'City',
                        hintText: 'Enter City',
                        prefixIcon: Icons.location_city,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your City' : null,
                      ),
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

                Container(
                  width: double.infinity,
                  height: 50,
                  child: GradientButton(
                    text: 'Sign Up',
                    textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (isChecked) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (context) => SendEmailOtp(),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please accept Terms & Conditions")),
                          );
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ', style: TextStyle(fontSize: 14)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32)),
                          ),
                          builder: (context) =>  SigninWithEmail(),
                        );
                      },
                      child: const Text(
                        'Sign in here',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({String label = 'Select', IconData? icon = Icons.arrow_drop_down}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: const [
        DropdownMenuItem(value: 'Retailer', child: Text('Retailer')),
        DropdownMenuItem(value: 'Distributor', child: Text('Distributor')),
        DropdownMenuItem(value: 'Wholesale', child: Text('Wholesale')),
      ],
      onChanged: (value) {},
      validator: (value) => value == null ? 'Please select $label' : null,
    );
  }
}