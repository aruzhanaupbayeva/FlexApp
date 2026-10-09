
import 'package:flutter/material.dart';
import '../main.dart';

class WorkoutCard extends StatelessWidget {
  final Map<String, dynamic> workout;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const WorkoutCard({
    super.key,
    required this.workout,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF34295D),
          child: Icon(
            workout['icon'] as IconData,
            color: Colors.white,
          ),
        ),
        title: Text(
          workout['name'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${workout['description']}\n${workout['duration']}',
        ),
        isThreeLine: true,
        trailing: IconButton(
          onPressed: onFavorite,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.pinkAccent : Colors.white70,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}