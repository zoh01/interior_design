class OrderItem {
  final String title;
  final String date;
  final String order;
  final String shipping;
  final void Function()? ontap;

  OrderItem(this.title, this.date, this.order, this.shipping, this.ontap);
}