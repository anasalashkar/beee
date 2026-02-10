import'dart:convert';
import 'package:bee/models/restaurnat.dart';
import 'package:flutter/material.dart';

class ResturantCard extends StatelessWidget {
  final restaurant r;
  const ResturantCard({super.key,required this.r});

  @override
  Widget build(BuildContext context) {
    return Card(
color: Colors.white,
elevation: 6,
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(22),
  side: const BorderSide(color: Colors.orange ,width: 1.5)
),
shadowColor: Colors.orange.withOpacity(0.15),
child: Padding(padding: const EdgeInsetsGeometry.all(14),
  child: Row(
    children: [
      ClipRRect(borderRadius:BorderRadius.circular(16),
      child: Image.network(r.ImageUrl,width: 100,height: 100,fit:BoxFit.cover,
      errorBuilder: (c,e,s)=> const Icon(Icons.restaurant,size: 60,color: Colors.orange,),),),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            r.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade700,
            ),
          ),
          const SizedBox(height: 6),

          Text(
            r.address,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            r.phone.toString(),
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 18),
              const SizedBox(width: 4),
              Text(
                r.rate.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ))

    ],
  ),


),






    );
  }
}
