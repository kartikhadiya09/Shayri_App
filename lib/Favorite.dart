import 'package:flutter/material.dart';
import 'package:sayings/db/Datasql.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    Getmenu();
  }
  List list = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
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
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        width: double.infinity,
                        color: Colors.red,
                        child: Text("${list[index]["favoritetable"]}"),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void Getmenu() async {
    EXDB exdb = EXDB();
    List<Map<String, dynamic>> l1 = await exdb.redFav();
    setState(() {
      list = l1;
    });
  }
}
