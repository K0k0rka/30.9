import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:ssk_manager/src/consts/ulr.dart';
import 'package:ssk_manager/src/models/computers.dart';
import 'package:ssk_manager/src/models/supply.dart';

import '../models/tech_type.dart';
import '../models/user.dart';

class InventoryListDatabase {
  static var databaseData = [];

  static Future getComputerDataFromDatabase() async {
    sqfliteFfiInit();
    List<Computer> computerList = [];

    int iterater = 1;
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(databaseUrl);

    databaseData = await db.rawQuery('select * from "$computersTableName"');

    await db.close();
    
    for(var i = 0; i < databaseData.asMap().length; i++){
      computerList.add(Computer.fromJson(databaseData.asMap()[i]));
      computerList[i].id = iterater;

      iterater++;
    }

    return computerList;
  }
  static Future getUserDataFromDatabase() async {
    sqfliteFfiInit();
    List<User> userList = [];

    int iterator = 1;
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(databaseUrl);

    databaseData = await db.rawQuery('select * from "$userTableName"');

    await db.close();

    for(var i = 0; i < databaseData.asMap().length; i++){
      userList.add(User.fromJson(databaseData.asMap()[i]));
      userList[i].id = iterator;

      iterator++;
    }

    return userList;
  }
  static Future getSupplyDataFromDatabase() async {
    sqfliteFfiInit();
    List<Supply> supplyist = [];

    int iterater = 1;
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(databaseUrl);

    databaseData = await db.rawQuery(Supply.selectDBQuery);

    await db.close();

    for(var i = 0; i < databaseData.asMap().length; i++){
      supplyist.add(Supply.fromJson(databaseData.asMap()[i]));
      supplyist[i].id = iterater;

      iterater++;
    }
    return supplyist;
  }
  static Future getTechTypeDataFromDatabase() async {
    sqfliteFfiInit();
    List<TechType> techTypelist = [];

    int iterater = 1;
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(databaseUrl);

    databaseData = await db.rawQuery('select * from "$techTypeTableName"');

    await db.close();

    for(var i = 0; i < databaseData.asMap().length; i++){
      techTypelist.add(TechType.fromJson(databaseData.asMap()[i]));
      techTypelist[i].id = iterater;

      iterater++;
    }

    debugPrint(techTypelist.toString());
    return techTypelist;
  }
}
