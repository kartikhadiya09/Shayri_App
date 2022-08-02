import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayings/db/Datasql.dart';

class Sayri extends StatefulWidget {
  const Sayri({Key? key}) : super(key: key);

  @override
  State<Sayri> createState() => _SayriState();
}

class _SayriState extends State<Sayri> {
  @override
  void initState() {
    Getmenu();
  }

  List list = [];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text("SHAYRI MENU"),
        ),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      Getmenu();
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Download",
                                  arguments: list[index]["catid"]);
                            },
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                            child: Image.asset(
                                              "assets/${index + 1}.jpg",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "${list[index]["catname"]}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Getmenu() async {
    EXDB exdb = EXDB();
    List<Map<String, dynamic>> l1 = await exdb.redData();
    setState(() {
      list = l1;
    });
  }
}
