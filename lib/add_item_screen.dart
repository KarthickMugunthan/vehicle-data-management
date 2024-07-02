import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'item_provider.dart';

class AddItemScreen extends StatefulWidget {
  final Item item;
  final int index;

  AddItemScreen({required this.item, required this.index});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  late TextEditingController _titleController;
  late TextEditingController _vnumberController;
  late TextEditingController _dnameController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _eo1Controller;
  late TextEditingController _do1Controller;
  late TextEditingController _ho1Controller;
  late TextEditingController _co1Controller;
  File? _image;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.item.title);
    _vnumberController = TextEditingController(text: widget.item.vnumber);
    _dnameController = TextEditingController(text: widget.item.dname);
    _mobileNumberController = TextEditingController(text: widget.item.mobileNumber);
    _eo1Controller = TextEditingController(text: widget.item.eo1.toString());
    _do1Controller = TextEditingController(text: widget.item.do1.toString());
    _ho1Controller = TextEditingController(text: widget.item.ho1.toString());
    _co1Controller = TextEditingController(text: widget.item.co1.toString());
    _image = widget.item.image;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _vnumberController.dispose();
    _dnameController.dispose();
    _mobileNumberController.dispose();
    _eo1Controller.dispose();
    _do1Controller.dispose();
    _ho1Controller.dispose();
    _co1Controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedItem = Item(
                title: _titleController.text,
                vnumber: _vnumberController.text,
                dname: _dnameController.text,
                mobileNumber: _mobileNumberController.text,
                eo1: int.tryParse(_eo1Controller.text) ?? 0,
                neo1: (int.tryParse(_eo1Controller.text) ?? 0) + 450,
                do1: int.tryParse(_do1Controller.text) ?? 0,
                ndo1: (int.tryParse(_do1Controller.text) ?? 0) + 450,
                ho1: int.tryParse(_ho1Controller.text) ?? 0,
                nho1: (int.tryParse(_ho1Controller.text) ?? 0) + 1000,
                co1: int.tryParse(_co1Controller.text) ?? 0,
                nco1: (int.tryParse(_co1Controller.text) ?? 0) + 900,
                image: _image,
              );
              if (widget.index == -1) {
                Provider.of<ItemProvider>(context, listen: false).addItem(updatedItem);
              } else {
                Provider.of<ItemProvider>(context, listen: false).updateItem(widget.index, updatedItem);
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _vnumberController,
              decoration: InputDecoration(labelText: 'Vehicle number'),
            ),
            TextField(
              controller: _dnameController,
              decoration: InputDecoration(labelText: 'Driver name'),
            ),
            TextField(
              controller: _mobileNumberController,
              decoration: InputDecoration(labelText: 'Mobile number'),
            ),
            TextField(
              controller: _eo1Controller,
              decoration: InputDecoration(labelText: 'Engine oil serviced hour'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _do1Controller,
              decoration: InputDecoration(labelText: 'Drum oil & 4hup oil serviced hour'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _ho1Controller,
              decoration: InputDecoration(labelText: 'Hydraulic oil serviced hour'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _co1Controller,
              decoration: InputDecoration(labelText: 'Crown gearbox oil serviced hour'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!, height: 200, fit: BoxFit.cover),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}