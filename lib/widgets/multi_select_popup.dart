import 'package:flutter/material.dart';

class MultiSelectPopup extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectPopup({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectPopupState createState() => _MultiSelectPopupState();
}

class _MultiSelectPopupState extends State<MultiSelectPopup> {
  late List<String> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String item) {
        setState(() {
          if (selectedItems.contains(item)) {
            selectedItems.remove(item);
          } else {
            selectedItems.add(item);
          }
          widget.onSelectionChanged(selectedItems);
        });
      },
      itemBuilder: (BuildContext context) {
        return widget.items.map((item) {
          final isSelected = selectedItems.contains(item);
          return CheckedPopupMenuItem<String>(
            value: item,
            checked: isSelected,
            child: Text(item),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedItems.isEmpty ? 'Select Items' : selectedItems.join(', '),
              style: const TextStyle(fontSize: 14),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
