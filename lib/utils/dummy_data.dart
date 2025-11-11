import '../data/model/laptop.dart';
import '../modules/onboarding/view/model/on_boarding_item.dart';

class DummyData {
  DummyData._();

  static List<OnBoardingItem> onBoarding = [
    OnBoardingItem(
      image: 'assets/images/onBoarding-1.svg',
      title: 'Easy Shopping',
      description:
          'Shop effortlessly with our simple and user-friendly interface',
    ),
    OnBoardingItem(
      image: 'assets/images/onBoarding-2.svg',
      title: 'Secure Payment',
      description: 'Pay securely with top-notch protection for your data',
    ),
    OnBoardingItem(
      image: 'assets/images/onBoarding-3.svg',
      title: 'Track Your Order',
      description: 'Keep an eye on your orders, from purchase to delivery',
    ),
  ];

  static List<String> banners = [
    'assets/images/banner-1.png',
    'assets/images/banner-2.jpg',
    'assets/images/banner-3.jpg',
  ];
  static List<Laptop> laptops = [
    Laptop(
        id: 1,
        name: 'Dell XPS 13',
        price: 1200.99,
        image: 'assets/images/notebook_xps.png',
        rating: 4.5,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 2,
        name: 'Apple MacBook Pro 14',
        price: 1999.99,
        image: 'assets/images/macbook_pro_14.png',
        rating: 4.8,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 3,
        name: 'HP Spectre x360',
        price: 1150.75,
        image: 'assets/images/hp_spectre.png',
        rating: 4.6,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 4,
        name: 'Lenovo ThinkPad X1 Carbon',
        price: 1450.00,
        image: 'assets/images/lenovo_thinkPad_X1_carbon.png',
        rating: 4.7,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 5,
        name: 'ASUS ZenBook 14',
        price: 950.30,
        image: 'assets/images/ASUS_ZenBook_14.png',
        rating: 4.3,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 6,
        name: 'Acer Swift 3',
        price: 700.25,
        image: 'assets/images/Acer_Swift_3.png',
        rating: 4.2,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 7,
        name: 'Razer Blade 15',
        price: 2100.99,
        image: 'assets/images/Razer_Blade_15.png',
        rating: 4.9,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 8,
        name: 'Microsoft Surface Laptop 4',
        price: 1299.40,
        image: 'assets/images/Microsoft_Surface_Laptop_4.png',
        rating: 4.4,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 9,
        name: 'Samsung Galaxy Book Pro',
        price: 999.00,
        image: 'assets/images/Samsung_Galaxy_Book_Pro.png',
        rating: 4.5,
        quantity: 0,
        isFavourite: false),
    Laptop(
        id: 10,
        name: 'LG Gram 17',
        price: 1400.99,
        image: 'assets/images/LG_Gram_17.png',
        rating: 4.7,
        quantity: 0,
        isFavourite: false),
  ];
}
