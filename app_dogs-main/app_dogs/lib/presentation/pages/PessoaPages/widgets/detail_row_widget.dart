import 'package:flutter/material.dart';

class DetailRowWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;

  const DetailRowWidget(
      {super.key, required this.icon, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.teal, size: 20),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                value!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
