import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/Widgets/List.dart';
import '../Models/Game_Model.dart';

class Leaderboard_Screen extends StatelessWidget {
 final List<Game_Model> winnner_detail;
 const Leaderboard_Screen({Key? key, required this.winnner_detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60,left: 32,right: 26),
                child: InkWell(borderRadius: BorderRadius.circular(30),onTap:()=> onback(context) , child: const Icon(Icons.arrow_back_ios_outlined)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text("LEADER",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w700,color: const Color(0xff0D47A1),letterSpacing: 5)),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 78,bottom: 20,),
                child: Text("BOARD",style: GoogleFonts.poppins(fontSize: 35,fontWeight: FontWeight.w700,color: const Color(0xff0D47A1),letterSpacing: 8)),
              ),
            ]),
          Expanded(
            child: winnner_detail.isNotEmpty ?
            ListView.builder(
              itemCount: winnner_detail.length,
              itemBuilder:(context,index) {
                if (winnner_detail[index].player_1_Wins){
                  return const List_Tile(title: "Player 1", img_leading: 'assets/images/0_small_icon.png',img_trailing:'assets/images/trophy.png',color: Color(0xFFF5F5F5),);
                }
                else if(winnner_detail[index].player_1_Wins == false && winnner_detail[index].player_2_Wins == false){
                  return const List_Tile(title: "Game Draw", img_leading: 'assets/images/logo.png',img_trailing:'assets/images/logo.png',color: Color(0xff42A5F5),);
                }
                else{
                  return const List_Tile(title: "Player 2", img_leading: 'assets/images/X_small_icon.png',img_trailing:'assets/images/trophy.png',color: Color(0xFFF5F5F5),);
                }
              }

            ):Center(
            child: Text("No Game Played!",style:GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w700,color: const Color(0xff0D47A1))),
          ))
        ]),
    );
  }

  onback(BuildContext context) {
    Navigator.pop(context);
  }
}

