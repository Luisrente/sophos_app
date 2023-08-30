class Item {
  final String title;
  final String imageUrl;
  final bool isFavorite;

  Item({
    required this.title,
    required this.imageUrl,
    this.isFavorite = false,
  });


  Item copyWith({
   String? title,
   String? imageUrl,
   bool? isFavorite
  }
  ){
    return Item(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }


   factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'],
    );
  }

}

