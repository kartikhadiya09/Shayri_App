import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayings/db/Datasql.dart';

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  void initState() {}
  dynamic args;
  List list = [];
  bool S = false;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments;
    print("================== $args");
    getSay("$args");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SHAYRI"),
        ),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      getSay(args);
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
                          child: Stack(
                            children: [
                              Container(
                                height: 220,
                                width: double.infinity,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/gradient/${index + 1}.webp",
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                height: 220,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        height: 180,
                                        alignment: Alignment.center,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${list[index]["quotes"]}",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Clipboard.setData(ClipboardData(
                                                    text: list[index]
                                                        ["quotes"]));


                                              });
                                            },
                                            icon: Icon(Icons.copy),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                               if(S==false){
                                                 S=true;
                                               }
                                               else{
                                                 S=false;
                                               }
                                              });
                                            },
                                            icon: Icon(S == true
                                                ? Icons.star
                                                : Icons.star_border),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Image.asset("assets/1.jpg");
                                              });
                                            },
                                            icon: Icon(Icons.photo),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Clipboard.setData(ClipboardData(
                                                    text: list[index]
                                                        ["quotes"]));
                                              });
                                            },
                                            icon: Icon(Icons.share),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

  void getSay(String args) async {
    EXDB exdb = EXDB();
    List<Map<String, dynamic>> l1 = await exdb.redSay("$args");
    setState(() {
      list = l1;
    });
  }
}
