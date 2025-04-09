import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_work_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fc),
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xFF3D56F0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "My Profile",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.only(top: 60, bottom: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xfff7f8fc),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tonald Drump",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, color: Colors.blue, size: 18),
                          ],
                        ),
                        Text(
                          "Tonald@work.com",
                          style: GoogleFonts.poppins(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xffeef1fb),
                          child: Icon(Icons.tag_faces, size: 28, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle("ACCOUNT"),
                      buildCard([
                        buildTile(Icons.person_outline, "My Work Profile", onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MyWorkProfileScreen()),
                          );
                        }),
                        buildTile(Icons.business, "Office Assets"),
                        buildTile(Icons.payments_outlined, "Payroll & Tax"),
                        buildTile(Icons.shield_outlined, "Roles"),
                      ]),
                      const SizedBox(height: 20),
                      buildSectionTitle("SETTINGS"),
                      buildCard([
                        buildTile(Icons.lock_outline, "Change Password"),
                        buildTile(Icons.system_update_alt, "Versioning"),
                        buildTile(Icons.help_outline, "FAQ and Help"),
                        buildTile(Icons.logout, "Logout", iconColor: Colors.red),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget buildTile(IconData icon, String title, {Color iconColor = Colors.blue, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 22),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
