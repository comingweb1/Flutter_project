class Character {
  final String name;
  final String imageUrl;
  final String house; // Дополнительные поля
  final String patronus;

  Character({
    required this.name,
    required this.imageUrl,
    required this.house,
    required this.patronus,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imageUrl: json['image'] ?? 'https://static.wikia.nocookie.net/harrypotter/images/3/3e/Harry_Potter.png', // Оборачиваю состояние с URL
      house: json['house'] ?? 'Unknown',
      patronus: json['patronus'] ?? 'None',
    );
  }
}
