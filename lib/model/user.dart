class UserModel {
  final int id;
  final String name;
  final String? imageUrl;
  final String? phoneNumber;
  final String dateOfBirth;
  final String email;
  final String? nation;
  final String? level;
  final String? subject;

  const UserModel({
    this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
    this.nation,
    this.level,
    this.subject,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  static UserModel mock = UserModel(
    email: 'ntran@gmail.com',
    id: 1,
    name: 'name',
    dateOfBirth: DateTime.now().toIso8601String(),
    imageUrl:
        'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
  );

  UserModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? phoneNumber,
    String? dateOfBirth,
    String? email,
    String? nation,
    String? level,
    String? subject,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      nation: nation ?? this.nation,
      level: level ?? this.level,
      subject: subject ?? this.subject,
    );
  }
}
