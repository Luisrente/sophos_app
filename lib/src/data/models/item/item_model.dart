class Item {
  final String title;
  final String imageUrl;

  Item({
    required this.title,
    required this.imageUrl,
  });


  Item copyWith({
   String? title,
   String? imageUrl,
  }
  ){
    return Item(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }


   factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }

}

