import 'package:flutter/material.dart';

enum IconEnum {
  ICON_CLEAR("clear", Icon(Icons.clear)),
  ICON_CAMERA("camera", Icon(Icons.camera_alt)),
  ICON_PHOTO("photo", Icon(Icons.photo)),
  ICON_IMAGE("image", Icon(Icons.image)),
  ICON_FILE_COPY("file_copy", Icon(Icons.file_copy)),
  ICON_CREATE("create", Icon(Icons.create)),
  ICON_SEARCH("search", Icon(Icons.search)),
  ICON_MAP("map_outlined", Icon(Icons.map_outlined)),
  ICON_PRODUCT("inventory_2", Icon(Icons.inventory_2)),
  ICON_ARROW_BACK("arrow_back", Icon(Icons.arrow_back)),
  ICON_STOREFRONT("storefront", Icon(Icons.storefront)),
  ICON_ADD("add", Icon(Icons.add_circle)),
  ICON_STORE("me-store", Icon(Icons.store)),
  ICON_CATEGORY("category", Icon(Icons.category)),
  ICON_LOCALOFFER("local_offer", Icon(Icons.local_offer)),
  ICON_ORDER("order", Icon(Icons.assignment)),
  ICON_PERSON("person", Icon(Icons.person)),
  ICON_RECEIPT_LONG("receipt_long", Icon(Icons.receipt_long)),
  ICON_INVENTORY("inventory", Icon(Icons.inventory)),
  ICON_REVIEWS("reviews", Icon(Icons.reviews)),
  ICON_LOGOUT("logout", Icon(Icons.logout)),
  ICON_NOTIFICATION("notification", Icon(Icons.notifications)),
  ICON_HOME("home", Icon(Icons.home));

  final String name;
  final Icon icon;

  const IconEnum(this.name, this.icon);

  static Icon findIconByName(String name) => values.firstWhere((c) => c.name == name, orElse: () => ICON_HOME).icon;
}
