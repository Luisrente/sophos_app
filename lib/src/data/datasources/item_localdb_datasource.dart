import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sophos_app/src/data/models/models.dart';
import 'package:sophos_app/src/domain/datasources/datasources_interfaces.dart';

class ItemLocalDataSourceImpl extends ItemLocalDataSource {

  @override
  Future<List<Item>> getItems() async {
    final String data = await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((itemJson) => Item.fromJson(itemJson)).toList();
  }

  @override
  Future<void> toggleFavorite(Item item) async {
    final String data = await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> jsonData = json.decode(data);
    final updatedItems = jsonData.map((itemJson) {
      if (itemJson['title'] == item.title) {
        return {
          'title': itemJson['title'],
          'imageUrl': itemJson['imageUrl'],
          'isFavorite': !itemJson['isFavorite'],
        };
      } else {
        return itemJson;
      }
    }).toList();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/data.json');
    await file.writeAsString(json.encode(updatedItems));
  }
}
