import 'dart:io';

import 'package:flutter/material.dart';
import './components/indonesia.dart';
import 'package:provider/provider.dart';
import './providers/corona_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1485EF),
        title: const Text('Jumlah Kasus Corona di Indonesia', style: TextStyle(fontSize: 15)),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<CoronaProvider>(context, listen: false).getData(),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: FutureBuilder(
            future:
            Provider.of<CoronaProvider>(context, listen: false).getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              else if(snapshot.connectionState == ConnectionState.none){
                return AlertDialog(
                  title: Text('Tidak ada koneksi Internet', style: TextStyle(fontSize: 18)),
                  content: const Text('Periksa kembali koneksi WiFi / Cellular Data Anda!'),
                  actions: <Widget>[FlatButton(
                    child: Text('Keluar'),
                    onPressed: ()=> exit(0),
                  )],
                );
              }

              return Consumer<CoronaProvider>(
                builder: (context, data, _) {
                  return Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Indonesia(height: height, data: data,),
                      )

                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}