import 'customer.dart';
import 'lineitem.dart';

class Order{
  String id;
  String orderstatus;
  String totalprice;
  String orderdate;
  String orderpriority;
  String clerk;
  String shippriority;
  String comment;
  Customer customer;
  List<Lineitem> lineItems;

  Order(
      this.id,
      this.orderstatus,
      this.totalprice,
      this.orderdate,
      this.orderpriority,
      this.clerk,
      this.shippriority,
      this.comment,
      this.customer,
      this.lineItems);
}