// class SotryListModell {
//  final String image;
//  final String Text;
//  const SotryListModell({required this.image,required this.Text});
// }
class TestStoryModel {
  final String image; // يجب أن يكون `final` ليكون ثابتًا

  const TestStoryModel({required this.image});
}

class SotryListModell {
  final String image;
  final String Text;
  final List<TestStoryModel> additionalImages;

  const SotryListModell({
    required this.image,
    required this.Text,
    this.additionalImages = const [],
  });
}
