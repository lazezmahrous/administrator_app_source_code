import 'package:flutter/material.dart';

List<PopupMenuItem<String>> createPopupMenu({required List<String> list}) {
  // create a list of popup menu items
  List<PopupMenuItem<String>> menuItems = [];

  // iterate over the category list
  for (String category in list) {
    // create a popup menu item
    PopupMenuItem<String> menuItem = PopupMenuItem(
      value: category,
      child: Text(category),
    );

    // add the popup menu item to the list
    menuItems.add(menuItem);
  }

  // return the list of popup menu items
  return menuItems;
}
