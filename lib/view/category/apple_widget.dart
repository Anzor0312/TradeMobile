import 'package:flutter/material.dart';
import 'package:trademobile/config/constans.dart';
import 'package:trademobile/data/model/mobile_model.dart';
import 'package:trademobile/data/repository/repository.dart';
import 'package:trademobile/data/service/service.dart';


class ApplePage extends StatelessWidget {
  const ApplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MobileService().getMobile(Constans.appleUrl),
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
                return Column(
                  children: [Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(data[index].img.toString()),fit: BoxFit.fill)
                      ),
                    ),
                  ),
                  Text(data[index].title.toString())
                  ],
                );
              },itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}