import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'item_provider.dart';
import 'add_item_screen.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;
  final int index;

  ItemDetailScreen({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItemScreen(
                    item: item,
                    index: index,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<ItemProvider>(context, listen: false).deleteItem(index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: item.image != null
                  ? Image.file(item.image!, height: 200, fit: BoxFit.cover)
                  : Text('No Image'),
            ),
            SizedBox(height: 16),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                buildTableRow('Title', item.title),
                buildTableRow('Vehicle number', item.vnumber),
                buildTableRowBold('Driver name', item.dname),
                buildTableRowBold('Mobile number', item.mobileNumber),
                buildTableRowBold('Engine oil serviced hour', item.eo1.toString()),
                buildTableRowBold('Next engine oil service hour', item.neo1.toString()),
                buildTableRowBold('Drum oil & 4hup oil serviced hour', item.do1.toString()),
                buildTableRowBold('Next drum oil & 4hup oil service hour', item.ndo1.toString()),
                buildTableRowBold('Hydraulic oil serviced hour', item.ho1.toString()),
                buildTableRowBold('Next hydraulic oil service hour', item.nho1.toString()),
                buildTableRowBold('Crown gearbox oil serviced hour', item.co1.toString()),
                buildTableRowBold('Next crown gearbox oil service hour', item.nco1.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }

  TableRow buildTableRowBold(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}