class User {
  final id;
  final email;
  final fullName;
  final avatar;
  final postIds;
  final followers;
  final followings;
  final saved;
  final createAt;
  final token;

  User(
      {this.id,
      this.email,
      this.fullName,
      this.avatar,
      this.postIds,
      this.followers,
      this.followings,
      this.saved,
      this.createAt,
      this.token});

  factory User.fromJson(Map<String, dynamic> response) {
    if (response["message"] != null) return null;

    final json = response["user"];
    return User(
      id: json["_id"].toString(),
      email: json["email"].toString(),
      fullName: json["fullName"].toString(),
      avatar: json["avatar"].toString(),
      postIds: (json["postIds"] as List<dynamic>).cast<String>(),
      followers: (json["followers"] as List<dynamic>).cast<String>(),
      followings: (json["followings"] as List<dynamic>).cast<String>(),
      saved: (json["saved"] as List).toList(),
      createAt: json["createAt"],
      token: response["token"],
    );
  }
}
