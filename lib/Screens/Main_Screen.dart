import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/Screens/Leaderboard_Screen.dart';
import '../Models/Game_Model.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => Main_ScreenState();
}

class Main_ScreenState extends State<Main_Screen> {
    List<List<dynamic>> game_grid = [
      ["","",""],
      ["","",""],
      ["","",""]
    ];
    int game_turns=0;
    bool isPlayer_1=true;
    bool isPlayer_2 =false;
    List<Game_Model> winnner_detail=[];

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
                 padding: const EdgeInsets.only(top: 71,left: 70),
                 child: LayoutBuilder(builder: (context, constraints) {
                   if(isPlayer_1){
                     return const Card(elevation: 30,shape: CircleBorder(),child: Image(image: AssetImage('assets/images/player_1_icon.png'),height: 75,width: 75));
                   }
                   return const Image(image: AssetImage('assets/images/player_1_icon.png'),height: 75,width: 75);
                 })
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 87,left: 20),
                 child:Text("VS",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 40,color:Colors.black)),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 71,left: 20,right: 70),
                 child: LayoutBuilder(builder: (context, constraints) {
                   if(isPlayer_2){
                     return const Card(elevation: 30,shape: CircleBorder(),child: Image(image: AssetImage('assets/images/player_2_icon.png'),height: 75,width: 75));
                   }
                   return const Image(image: AssetImage('assets/images/player_2_icon.png'),height: 75,width: 75);
                 })
               ),
             ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 11,left: 69),
                child:Text("Player 1",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 22,color:const Color(0xff656565))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11,left: 93,right: 59),
                child:Text("Player 2",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 22,color:const Color(0xff656565))),
              ),
            ],
          ),

          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 36,left: 10,right: 10),
                height: 413,
                width: 369,
                  decoration: const BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/borderbox.png'))),
                child: Stack(
                  children: [
                    Column(
                    children:[
                      ...game_grid.asMap().map((indexCol, valueCol) => MapEntry( indexCol,
                        Row(
                              children: [
                                ...valueCol.asMap().map((indexRow, valueRow) => MapEntry( indexRow,
                                    SizedBox(height: 137,width: 123,child: OnGameBoard_tap(indexCol,indexRow,valueRow))))
                                    .values.toList()],
                            ))).values.toList(),
                      ],
                  ),
                  ]
                )
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 35,left: 10),
                width: 200,
                height: 62,
                child: ElevatedButton.icon(label: Text("Leader board",style: GoogleFonts.poppins(fontSize: 18,fontWeight:FontWeight.w600)), icon: const Image(image: AssetImage('assets/images/list_icon.png')),onPressed: ()=>onleaderboard(),style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                        )
                    ),
                  backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xff0D47A1),),
                ),),
              ),

              Container(
                  margin: const EdgeInsets.only(top: 35,left: 110,right: 10),
                  child: InkWell(borderRadius: BorderRadius.circular(30),onTap:()=>onreset(), child: const Icon(Icons.refresh,color: const Color(0xff0D47A1),size: 50))
              )
            ],
          )
        ],
      ),
    );
  }

    OnGameBoard_tap(int indexCol,int indexRow,var value) {
      return GestureDetector(
        onTap: () {
          if (game_turns != 9 && value == "") {
            if (isPlayer_1) {
              setState(() {
                game_grid[indexCol][indexRow] = "0";
                isPlayer_2 = true;
                isPlayer_1 = false;
                game_turns++;
              });
              if (gamewinner(indexCol, indexRow, "0")) {
                game_turns=9;
                winnner_detail.add(Game_Model(true,false));
                Future.delayed(const Duration(milliseconds: 500),() {
                showDialog(context: context, builder: (BuildContext context) => dialog("Player 1","WON",'assets/images/trophy_large.png',const Color(0xff0D47A1)));
                onreset();
                });
              }
              else if(gamewinner(indexCol, indexRow, "0") == false && game_turns == 9){
                winnner_detail.add(Game_Model(false, false));
                Future.delayed(const Duration(milliseconds: 500),() {
                showDialog(context: context, builder: (BuildContext context) => dialog("","Game Draw!!!",'assets/images/logo.png',const Color(0xff42A5F5)));
                onreset();});
              }
            }
            else if (isPlayer_2) {
              setState(() {
                game_grid[indexCol][indexRow] = "1";
                isPlayer_2 = false;
                isPlayer_1 = true;
                game_turns++;
              });
              if (gamewinner(indexCol, indexRow, "1")) {
                game_turns=9;
                winnner_detail.add(Game_Model(false,true));
                Future.delayed(const Duration(milliseconds: 500),() {
                showDialog(context: context, builder: (BuildContext context) => dialog("Player 2","WON",'assets/images/trophy_large.png',const Color(0xff0D47A1)));
                onreset();});
              }
              else if(gamewinner(indexCol, indexRow, "1") == false && game_turns == 9){
                Future.delayed(const Duration(milliseconds: 500),() {
                winnner_detail.add(Game_Model(false,false));
                showDialog(context: context, builder: (BuildContext context) => dialog("","Game Draw",'assets/images/logo.png',const Color(0xff0D47A1)));
                onreset();});
              }
            }
          }
        },
        child: LayoutBuilder(builder: (context, constraints) {
          if (value != "") {
            if (value == "0") {
              return const Image(image: AssetImage('assets/images/0_icon.png'),
                  height: 75,
                  width: 75);
            }
            else if (value == "1") {
              return const Image(image: AssetImage('assets/images/X_icon.png'),
                  height: 75,
                  width: 75);
            }
          }
          return const Text("");
        }),
      );
    }
  bool gamewinner(int indexCol,int indexRow,var value){
          //row check
              if (game_grid[indexCol][0] == game_grid[indexCol][1] && game_grid[indexCol][1] == game_grid[indexCol][2])
              {
                return true;
              }
          // column check
              if (game_grid[0][indexRow] == game_grid[1][indexRow] && game_grid[1][indexRow] == game_grid[2][indexRow])
              {
                return true;
              }
          // left diagonal check
              if (game_grid[0][0] == game_grid[1][1] && game_grid[1][1] == game_grid[2][2] && game_grid[0][0] != "")
              {
                return true;
              }
          // right diagonal check
              if (game_grid[0][2] == game_grid[1][1] && game_grid[1][1] == game_grid[2][0] && game_grid[0][2] != "")
              {
                return true;
              }
    return false;
  }

  onreset() {
    setState(() {
      game_grid = [
        ["","",""],
        ["","",""],
        ["","",""]
      ];
      game_turns=0;
       isPlayer_1=true;
       isPlayer_2=false;
    });
  }

  onleaderboard() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Leaderboard_Screen(winnner_detail:winnner_detail)));
  }
}
Widget dialog (String playerName,String txt,String imagePath,Color color){
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), //this right here
    backgroundColor:color,
    elevation: 10.0,
    child: SizedBox(
      height: 422,
      width: 369,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  const EdgeInsets.only(top: 51,left: 78,right: 79,bottom: 28),
            child: Image(image: AssetImage(imagePath)),
          ),
          Text(playerName,style: GoogleFonts.poppins(fontSize: 20,fontWeight:FontWeight.w400,color: Colors.white,letterSpacing: 1)),
          Text(txt,style: GoogleFonts.poppins(fontSize: 40,fontWeight:FontWeight.w700,color: Colors.white)) ,
        ],
      ),
    ),
  );
}
