import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sunday_mall/views/auth/login/signin_with_email.dart';
import 'package:sunday_mall/views/auth/login/signin_with_employeeid.dart';
import '../../../../widgets/gradient_button.dart';
import '../../forgotpassword/email_verification.dart';
import '../signup/signup_screen.dart';
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
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: viewInsets),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Phone Number"),
                  ),
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
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                            ),
                            builder: (context) => ForgotPasswordEmailVerifyScreeen(),
                          );
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: GradientButton(
                      text: 'Sign In',
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32)),
                          ),
                          builder: (context) => const OtpVerificationScreen(phoneNumber: '7655454654',),
                        );
                        // if (_formKey.currentState!.validate()) {
                        //   final fullNumber = phoneController.text.trim();
                        //   Navigator.pop(context);
                        //   showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                        //     ),
                        //     builder: (_) => OtpVerificationScreen(phoneNumber: fullNumber),
                        //   );
                        // }
                      },
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
                   // icon: Icons.badge,
                    imagePath: 'assets/images/apple.png',
                    label: "Sign in With Apple ID",
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        builder: (context) => const SigninWithEmployeeId(),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _outlinedLoginButton(
                   // icon: Icons.email_outlined,
                    imagePath: 'assets/images/signemail.png',
                    label: "Sign in With Email",
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        builder: (context) => const SigninWithEmail(),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
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
        ),
      ),
    );
  }



  Widget _outlinedLoginButton({
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


// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:sunday_mall/views/auth/login/signin_with_email.dart';
// import 'package:sunday_mall/views/auth/login/signin_with_employeeid.dart';
// import '../../../../widgets/gradient_button.dart';
// import '../../forgotpassword/email_verification.dart';
// import '../signup/signup_screen.dart';
// import 'otp_verification.dart';
//
// class SigninWithPhoneNumber extends StatefulWidget {
//   const SigninWithPhoneNumber({super.key});
//
//   @override
//   State<SigninWithPhoneNumber> createState() => _SigninWithPhoneNumberState();
// }
//
// class _SigninWithPhoneNumberState extends State<SigninWithPhoneNumber> {
//   Country selectedCountry = Country(
//     phoneCode: '91',
//     countryCode: 'IN',
//     e164Sc: 0,
//     geographic: true,
//     level: 1,
//     name: 'India',
//     example: '9123456789',
//     displayName: 'India',
//     displayNameNoCountryCode: 'India',
//     e164Key: '',
//   );
//
//   final TextEditingController phoneController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool isValidPhone = false;
//   bool _rememberMe = false;
//
//   @override
//   void initState() {
//     super.initState();
//     phoneController.addListener(() {
//       final phone = phoneController.text.trim();
//       final valid = RegExp(r'^\d{10}$').hasMatch(phone);
//       if (valid != isValidPhone) {
//         setState(() {
//           isValidPhone = valid;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     phoneController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final viewInsets = MediaQuery.of(context).viewInsets.bottom;
//
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(bottom: viewInsets),
//         child: Container(
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//           ),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Center(
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Center(
//                     child: Text(
//                       "Sign in to my account",
//                       style: TextStyle(color: Colors.black54),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Phone Number"),
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             showCountryPicker(
//                               context: context,
//                               showPhoneCode: true,
//                               onSelect: (Country country) {
//                                 setState(() {
//                                   selectedCountry = country;
//                                 });
//                               },
//                             );
//                           },
//                           child: Row(
//                             children: [
//                               Text(
//                                 "+${selectedCountry.phoneCode}",
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const Icon(Icons.arrow_drop_down),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: TextFormField(
//                             controller: phoneController,
//                             decoration: const InputDecoration(
//                               hintText: "Enter Phone Number",
//                               border: InputBorder.none,
//                               counterText: '',
//                             ),
//                             keyboardType: TextInputType.phone,
//                             maxLength: 10,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Enter phone number';
//                               } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                                 return 'Phone number must be 10 digits';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _rememberMe,
//                             onChanged: (value) {
//                               setState(() {
//                                 _rememberMe = value!;
//                               });
//                             },
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                           ),
//                           const Text("Remember Me"),
//                         ],
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//                             ),
//                             builder: (context) => ForgotPasswordEmailVerifyScreeen(),
//                           );
//                         },
//                         child: const Text(
//                           "Forgot Password",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: isValidPhone ? Colors.blue : Colors.grey.shade400,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                       onPressed: isValidPhone
//                           ? () {
//                         if (_formKey.currentState!.validate()) {
//                           final fullNumber =
//                               "+${selectedCountry.phoneCode}${phoneController.text}";
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => OtpVerificationScreen(phoneNumber: fullNumber),
//                             ),
//                           );
//                         }
//                       }
//                           : null,
//                       child: const Text("Sign In",style: TextStyle(color: Colors.white),),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   const Row(
//                     children: [
//                       Expanded(child: Divider(color: Colors.grey)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text("OR"),
//                       ),
//                       Expanded(child: Divider(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   _outlinedLoginButton(
//                     imagePath: 'assets/images/apple.png',
//                     label: "Sign in With Apple ID",
//                     onTap: () {
//                       Navigator.pop(context);
//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//                         ),
//                         builder: (context) => const SigninWithEmployeeId(),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 12),
//                   _outlinedLoginButton(
//                     imagePath: 'assets/images/signemail.png',
//                     label: "Sign in With Email",
//                     onTap: () {
//                       Navigator.pop(context);
//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//                         ),
//                         builder: (context) => const SigninWithEmail(),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 24),
//                   const SizedBox(height: 16),
//                   Center(
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SignupScreen()),
//                         );
//                       },
//                       child: const Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Don’t have an account? ",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: "Sign Up Here",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _outlinedLoginButton({
//     required String label,
//     required VoidCallback onTap,
//     required String imagePath,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: OutlinedButton(
//         onPressed: onTap,
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Colors.blue),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               height: 24,
//               width: 24,
//             ),
//             const SizedBox(width: 10),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 15,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
