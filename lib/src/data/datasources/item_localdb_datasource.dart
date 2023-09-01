import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sophos_app/src/data/models/models.dart';
import 'package:sophos_app/src/domain/datasources/datasources_interfaces.dart';

class ItemLocalDataSourceImpl extends ItemLocalDataSource {
  @override
  Future<List<Item>> getItems() async {
    final String data = await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((itemJson) => Item.fromJson(itemJson)).toList();
  }
}
