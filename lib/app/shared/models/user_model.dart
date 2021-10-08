class UserModel {
  final String id;
  final String name;

  UserModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory UserModel.fromMap(String? id, Map? data) {
    data = data ?? {};

    return UserModel(
      id: id ?? "",
      name: data["name"] ?? "",
    );
  }
}
