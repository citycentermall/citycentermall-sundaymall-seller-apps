import 'package:flutter/material.dart';

class CustomDropdownFields extends StatelessWidget {
  final String title;
  final String label;
  final IconData icon;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownFields({
    super.key,
    required this.title,
    required this.label,
    required this.icon,
    required this.items,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          isExpanded: true,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
            value: item,

            child: Text(item),
          ))
              .toList(),
          onChanged: onChanged,
          validator: validator ?? (value) => value == null ? 'Please select $label' : null,
        ),
      ],
    );
  }
}
