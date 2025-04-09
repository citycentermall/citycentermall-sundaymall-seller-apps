import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sunday_mall/views/profile/work_profile_updated_confermation.dart';

import '../../widgets/gradient_button.dart';

class MyWorkProfileScreen extends StatelessWidget {
  const MyWorkProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Work Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  personalInfoCard(),
                  const SizedBox(height: 24),
                  Text('Address',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      )),
                  const SizedBox(height: 4),
                  Text('Your current domicile',
                      style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your address',
                        hintStyle: GoogleFonts.poppins(fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: GradientButton(
                  text: 'Update Profile',
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => showUpdateProfileBottomSheet(),
                    );
                },)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget personalInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Data Information',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 4),
          Text('Your personal data information',
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 16),
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [6, 4],
                  color: Colors.blue,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF6F8FE),
                    ),
                    child: const Icon(Icons.image_outlined, size: 40, color: Colors.blue),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.upload, color: Colors.white, size: 16),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Column(
              children: [
                Text('Upload Photo',
                    style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                  'Format should be in .jpeg, .png atleast\n800x800px and less than 5MB',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildInputField('First Name', 'Tonald', Icons.person_outline),
          buildInputField('Last Name', 'Drump', Icons.person_outline),
          buildInputField('Date of Birth', 'Date of Birth', Icons.calendar_month_outlined),
          buildInputField('Business', 'Type Of Business', Icons.business_outlined),
        ],
      ),
    );
  }

  Widget buildInputField(String label, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(fontSize: 13),
              prefixIcon: Icon(icon, size: 20),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
