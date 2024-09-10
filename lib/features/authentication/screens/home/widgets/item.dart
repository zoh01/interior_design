import 'package:interior_design/features/authentication/screens/home/widgets/product.dart';

class Item {
  final String title;
  final String image;
  final double price;
  final String rate;
  final void Function()? ontap;

  Item(this.title, this.image, this.price, this.rate, this.ontap);
}