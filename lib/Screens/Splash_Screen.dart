import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/Screens/Main_Screen.dart';

class Splash_Screen extends StatefulWidget{
  const Splash_Screen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Splash_Screen();
}
class _Splash_Screen extends State<Splash_Screen>{
  @override
  void initState() {
    super.initState();
   Future.delayed( const Duration(seconds: 7),() => nav_screen(context, const Main_Screen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
              children: [
                Container(
                 color: const Color(0xff0D47A1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80,left: 90,right: 89,bottom: 350),
                    child: Text("KATI ZERO",style:GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 35,color: Colors.white,letterSpacing: 4,wordSpacing: 13)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 400),
                  color:const Color(0xff42A5F5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 290,left: 134,right: 134),
                            child: Text("POWERED BY",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:3, left: 107,right: 107),
                            child: Text("TECH IDARA",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 25,color: const Color(0xff0D47A1),letterSpacing: 3,wordSpacing: 3)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                   top: 300,
                  left: 128,
                  right: 128,
                  child: Material(
                    color: Colors.transparent,
                            child: InkWell(
                                borderRadius: BorderRadius.circular(30), // needed
                              child:const Image(image: AssetImage('assets/images/logo.png'), width: 172,height: 174)) ,
                  ))
              ]));
  }
  void nav_screen(BuildContext context, Widget screen) => Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>screen));
}
