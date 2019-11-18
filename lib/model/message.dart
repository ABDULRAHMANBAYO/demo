import 'package:demo/utils/utils';

class Message {
  int id;
  String name, desc, image, timeStap;

  Message(this.id, this.name, this.desc, this.image, this.timeStap);
}

List getMessages() {
  return [
    Message(
      1,
      'Jennifer Tyler(4)',
      'It\'s going well! How about you?',
      ImageAssetPath.model1Image,
      '2m',
    ),
    Message(
      2,
      'Minder-Birthday Wishes',
      'Happy Birthday Sammy!!!',
      ImageAssetPath.model2Image,
      'Mar 24',
    ),
    Message(
      3,
      'Linnie Lyons',
      'Can we take our dogs for a walk?',
      ImageAssetPath.model3Image,
      'Mar 20',
    ),
    Message(
      4,
      'Minder-Health Tips',
      'Spring tips for cats and dogs',
      ImageAssetPath.model4Image,
      'Feb 26',
    ),
    Message(
      5,
      'Minder-Health Tips',
      'The right food for my pet...',
      ImageAssetPath.model5Image,
      'Feb 19',
    ),
    Message(
      6,
      'Mildred Nelson',
      'Hi! Nice to meet you.',
      ImageAssetPath.model5Image,
      'Feb 10',
    ),
  ];
}
