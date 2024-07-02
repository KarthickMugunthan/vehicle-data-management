import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_monitoring/item.dart';
import 'item_provider.dart';
import 'item_detail_screen.dart';
import 'add_item_screen.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItemScreen(
                    item: Item(
                      title: '',
                      vnumber: '',
                      dname: '',
                      mobileNumber: '',
                      eo1: 0,
                      neo1: 0,
                      do1: 0,
                      ndo1: 0,
                      ho1: 0,
                      nho1: 0,
                      co1: 0,
                      nco1: 0,
                    ),
                    index: -1,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.vnumber),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailScreen(
                        item: item,
                        index: index,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}