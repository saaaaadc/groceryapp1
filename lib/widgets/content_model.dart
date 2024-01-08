class UnboardingContent {
  late String image;
  late String title;
  late String description;

  UnboardingContent({
    required this.image, required this.title, required this.description
  });

  List<UnboardingContent>contents = [
    UnboardingContent(image: 'images/salad.jpg',
        title: 'Select from our menu\n  --- Best Menu',
        description: 'Pick your food from our menu\n More than 35 times'),
    UnboardingContent(image: 'images/Burger-43.png',
        title: 'Easy and Online Payment',
        description: 'You can pay cash on delivery and\n Card payment'),
    UnboardingContent(
        image: 'images/pngtree-ice-cream-dessert-realistic-white-background-transparent-png-image_9047252.png',
        title: 'Quick delivery at your doorstep',
        description: 'Deliver your food at your\n  Doorstep')
  ];
}

