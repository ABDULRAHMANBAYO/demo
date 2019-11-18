import 'package:demo/utils/utils';

class News {
  int id;
  String name, desc, image, trailing;

  News(this.id, this.name, this.desc, this.image, this.trailing);
}

List getNews() {
  return [
    News(
        1,
        'John Minalo',
        'commented on your photo.15m \"So Cute, I love it!!!',
        ImageAssetPath.model1Image,
        'assets/images/model.jpg'),
    News(
      2,
      'Linne Lyons',
      'love your comment in your photo.1h',
      ImageAssetPath.model2Image,
      'assets/images/model.jpg',
    ),
    News(
      3,
      'Callie Holland, Emily',
      'love your photos.3h',
      ImageAssetPath.model4Image,
      'assets/images/model.jpg',
    ),
    News(
      4,
      'Anni Tran',
      'started following you.3h',
      ImageAssetPath.model3Image,
      'assets/images/model.jpg',
    ),
    News(
      6,
      'John Minalo',
      'commented on your photo.3h \"I really like!!!\"',
      ImageAssetPath.model3Image,
      'assets/images/model.jpg',
    ),
     News(
      9,
      'Linnie Lyons',
      'started favorites your sammy.4h',
      ImageAssetPath.model3Image,
      '',
    ),
    News(
      7,
      'Linnie Lyons',
      'started following you.4h',
      ImageAssetPath.model3Image,
      'assets/images/model.jpg',
    ),
    News(
      9,
      'Emilly Sander',
      'started favorites your sammy.4h',
      ImageAssetPath.model3Image,
      '',
    ),
  ];
}
