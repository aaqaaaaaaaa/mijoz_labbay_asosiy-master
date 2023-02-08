
class OnBoardingModel {
  String text;
  String image;

  OnBoardingModel({required this.text, required this.image});
}

List<OnBoardingModel> contents = [
  OnBoardingModel(
      image: 'assets/images/onboarding1.svg',
      text: 'Sevimli restoran yoki do\'koningizni tanlang'),
  OnBoardingModel(
      image: 'assets/images/onboarding2.svg',
      text: 'Sevimli taomingizga yoki kerakli mahsulotlarga buyurtma bering'),
  OnBoardingModel(
      image: 'assets/images/onboarding3.svg',
      text: 'Biz tez va samarali yetkazib beramiz'),
];
