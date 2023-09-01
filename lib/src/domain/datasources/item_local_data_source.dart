
import 'package:sophos_app/src/data/models/models.dart';

abstract class ItemLocalDataSource {
  Future<List<Item>> getItems();
}