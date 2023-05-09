import 'package:flutter/material.dart';
import 'package:trademobile/config/constans.dart';
import 'package:trademobile/data/model/mobile_model.dart';
import 'package:trademobile/data/repository/repository.dart';
import 'package:trademobile/data/service/service.dart';

class SamsungPage extends StatelessWidget {
  const SamsungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:CurrencyRepositoy().chekDatabase(Constans.samsungUrrl),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.error is String) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            List<MobileModel> data = snapshot.data as List<MobileModel>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  
                  ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                       Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(data[index].img.toString()),fit: BoxFit.fill)
                        ),
                      ),
                      
                    
                    Text(data[index].title.toString())
                    ],
                  ),
                );
              },itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
