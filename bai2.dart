import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('bai 2'),
      ),
      body: SafeArea(
        child: Container(
            //alignment: Alignment.topCenter,
            //width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Đồng Văn Tuấn Đạt _ 0850080015_08_DH_CNPM',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                buildRowLayout(),

                SizedBox(
                  height: 150,
                ),
                
                Image.network(
                  'https://blog.vietnamlab.vn/content/images/1TNFw_7wEA1yZ-GSEtReH76r5tDTTioGQ.png',
                  width: 1200,
                ),

                SizedBox(
                  height: 50,
                ),

                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Nut da duoc bam!')));
                    },
                    child: Text('Bấm Vào Đây!')),
              ],
            )),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.black,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.lightBlue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.pink,
        height: 100,
        width: 100,
      )
    ],
  );
}
