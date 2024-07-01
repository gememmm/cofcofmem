class CoffeeModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final List<String> ingredients;

  CoffeeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.ingredients,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'ingredients': ingredients.join(', '),
    };
  }
}
