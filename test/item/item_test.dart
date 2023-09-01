import 'package:flutter_test/flutter_test.dart';
import 'package:sophos_app/src/data/models/models.dart';

void main() {
  test('Item.fromJson debe construir correctamente desde JSON', () {
    final json = {'title': 'Titulo', 'imageUrl': 'imagen.jpg'};
    final item = Item.fromJson(json);
    
    expect(item.title, 'Titulo');
    expect(item.imageUrl, 'imagen.jpg');
  });
  
  test('Item.copyWith debe crear una copia con valores actualizados', () {
    final originalItem = Item(title: 'Original', imageUrl: 'imagen1.jpg');
    final updatedItem = originalItem.copyWith(title: 'Actualizado');
    
    expect(updatedItem.title, 'Actualizado');
    expect(updatedItem.imageUrl, 'imagen1.jpg'); // No debería haber cambiado
  });
}
