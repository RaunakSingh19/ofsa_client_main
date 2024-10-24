import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MultiSelectDropDown extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectDropDown({
    super.key,
    required this.items,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectDropDownState createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Items',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              enabled: false, // Prevent closing the menu on selection
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedItems.remove(item);
                        } else {
                          selectedItems.add(item);
                        }
                        widget.onSelectionChanged(selectedItems);
                      });
                      // Update the dropdown menu UI
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          if (isSelected)
                            const Icon(Icons.check_box_outlined)
                          else
                            const Icon(Icons.check_box_outline_blank),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          value: null, // Set value to null for multi-select
          onChanged: (value) {}, // No-op as we handle selection in InkWell
          // Display the selected items in a readable format
          selectedItemBuilder: (context) {
            return widget.items.map(
                  (item) {
                return Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    selectedItems.isEmpty
                        ? 'Select Items'
                        : selectedItems.join(', '), // Show selected items
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                );
              },
            ).toList();
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 16, right: 8),
            height: 40,
            width: 180,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
