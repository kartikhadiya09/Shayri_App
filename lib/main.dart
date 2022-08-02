import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayings/Download.dart';
import 'package:sayings/Favorite.dart';
import 'package:sayings/Sayri.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        'Sayri': (context) => Sayri(),
        'Download': (context) => Download(),
        'Favorite': (context) => Favorite(),
      },
    ),
  );
}



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange.shade200,
        body: Column(
          children: [
            Container(
              height: 40,
              child: AppBar(

                centerTitle: true,
                title: Text("Amazing Quotes"),
                backgroundColor: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "Sayri");
                    },
                    child: Container(
                      height: 120,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit,color: Colors.white,size: 35,),
                          SizedBox(height: 5,),
                          Text("SHAYRI",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 120,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download,color: Colors.white,size: 35,),
                          SizedBox(height: 5,),
                          Text("DOWNLOAD",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "Favorite");
                    },
                    child: Container(
                      height: 120,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,color: Colors.white,size: 35,),
                          SizedBox(height: 5,),
                          Text("FAVORITE",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 120,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share,color: Colors.deepOrange.shade300,size: 35,),
                          SizedBox(height: 5,),
                          Text("SHARE",style: TextStyle(fontSize: 25,color: Colors.deepOrange.shade50,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
