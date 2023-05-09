import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trademobile/data/model/mobile_model.dart';
import 'package:trademobile/data/service/service.dart';

class CurrencyRepositoy {
  late Isar db;
  Future<dynamic> chekDatabase(String category) async {
    
    db = await openDatabase();
    if (await db.mobileModels.count() == 0) {
      return getCurency(category);
    } else {
      return await db.mobileModels.where().findAll();
    }
  }

  Future<dynamic> getCurency(String category) async {
    MobileService mobileService = MobileService();
    return await mobileService
        .getMobile(category)
        .then((dynamic response) async {
      print(response.toString());
      if (response is List<MobileModel>) {
        db = await openDatabase();
        await writeToDatabase(response);
        return await db.mobileModels.where().findAll();
      } else {
        return response.toString();
      }
    });
  }

  Future<Isar> openDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MobileModelSchema], directory: appDocDir.path);
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  Future<void> writeToDatabase(List<MobileModel> data) async {
    final isar = db;
    isar.writeTxn(() async {
      await isar.mobileModels.clear();
      await isar.mobileModels.putAll(data);
    });
  }
}
