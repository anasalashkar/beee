import 'package:bee/models/meal.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final meal m;
  const MealCard({super.key,required this.m});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 260,
      child: Card(
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
                child: Image.network(m.imgUrl,width: 100,height: 100,fit:BoxFit.cover,
                  errorBuilder: (c,e,s)=> const Icon(Icons.set_meal,size: 60,color: Colors.orange,),),),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    m.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    m.info,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    m.resName,
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
                        m.price.toString(),
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






      ),
    );
  }
}
