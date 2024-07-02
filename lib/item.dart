import 'dart:io';

class Item {
  String title;
  String vnumber;
  String dname;
  String mobileNumber;
  int eo1;
  int neo1;
  int do1;
  int ndo1;
  int ho1;
  int nho1;
  int co1;
  int nco1;
  File? image;

  Item({
    required this.title,
    required this.vnumber,
    required this.dname,
    required this.mobileNumber,
    required this.eo1,
    required this.neo1,
    required this.do1,
    required this.ndo1,
    required this.ho1,
    required this.nho1,
    required this.co1,
    required this.nco1,
    this.image,
  });
}