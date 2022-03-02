import 'customer.dart';
import 'lineitem.dart';

class Order {
  String id;
  String orderstatus;
  String totalprice;
  String orderdate;
  String orderpriority;
  String clerk;
  String shippriority;
  String comment;
  String customer;
  // List<Lineitem> lineItems;

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
    // this.lineItems
  );

  //1
  Order.fromJson(Map<String, dynamic> json)
      : orderstatus = json['O_ORDERSTATUS'].toString(),
        totalprice = json['O_TOTALPRICE'].toString(),
        orderdate = json['O_ORDERDATE'].toString(),
        orderpriority = json['O_ORDERPRIORITY'].toString(),
        clerk = json['O_CLERK'].toString(),
        shippriority = json['O_SHIPPRIORITY'].toString(),
        comment = json['O_COMMENT'].toString(),
        customer = json['O_CUSTKEY'].toString(),
        super(json['O_ORDERKEY'].toString());
}
