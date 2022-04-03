import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class List_Tile extends StatelessWidget {

  final String title,img_leading,img_trailing;
  final Color color;
  const List_Tile({required this.title,required this.img_leading,required this.img_trailing,required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        margin: const EdgeInsets.only(left: 24,right: 24,bottom: 9),
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:ListTile(
          contentPadding: const EdgeInsets.all(25),
          title: Text(title,
              style:GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 20,letterSpacing: 1)
              ),
          leading: Image(image: AssetImage(img_leading)),
          trailing: Image(image: AssetImage(img_trailing)),
        )
    );
  }
}