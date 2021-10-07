class TeacherModel {
  final int id;
  final double star;
  final List<String> fields;
  final String name;
  final String description;
  final String imageUrl;
  final bool isFavorite;

  const TeacherModel({
    required this.id,
    required this.star,
    required this.fields,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isFavorite,
  });

  static const TeacherModel mock = TeacherModel(
    id: 1,
    star: 5,
    fields: [
      'English',
      'Vietnamese',
      'French',
      'Spanish',
    ],
    name: 'Teacher Yolly',
    description:
        'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    imageUrl:
        'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
    isFavorite: true,
  );

  static const TeacherModel mock1 = TeacherModel(
    id: 1,
    star: 5,
    fields: ['English', 'Vietnamese'],
    name: 'Teacher Ria',
    description:
        'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    imageUrl:
        'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
    isFavorite: false,
  );
}
