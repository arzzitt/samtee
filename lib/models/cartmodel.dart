class CartModel {
  CartModel({
    required this.coupons,
    required this.shippingRates,
    required this.shippingAddress,
    required this.items,
    required this.itemsCount,
    required this.itemsWeight,
    required this.needsPayment,
    required this.needsShipping,
    required this.hasCalculatedShipping,
    required this.totals,
    required this.errors,
    required this.paymentRequirements,
    required this.extensions,
  });
  late final List<Coupons> coupons;
  late final List<ShippingRates> shippingRates;
  late final ShippingAddress shippingAddress;
  late final List<Items> items;
  late final int itemsCount;
  late final int itemsWeight;
  late final bool needsPayment;
  late final bool needsShipping;
  late final bool hasCalculatedShipping;
  late final Totals totals;
  late final List<dynamic> errors;
  late final List<String> paymentRequirements;
  late final Extensions extensions;

  CartModel.fromJson(Map<String, dynamic> json) {
    coupons =
        List.from(json['coupons']).map((e) => Coupons.fromJson(e)).toList();
    shippingRates = List.from(json['shipping_rates'])
        .map((e) => ShippingRates.fromJson(e))
        .toList();
    shippingAddress = ShippingAddress.fromJson(json['shipping_address']);
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    itemsCount = json['items_count'];
    itemsWeight = json['items_weight'];
    needsPayment = json['needs_payment'];
    needsShipping = json['needs_shipping'];
    hasCalculatedShipping = json['has_calculated_shipping'];
    totals = Totals.fromJson(json['totals']);
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    paymentRequirements =
        List.castFrom<dynamic, String>(json['payment_requirements']);
    extensions = Extensions.fromJson(json['extensions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coupons'] = coupons.map((e) => e.toJson()).toList();
    _data['shipping_rates'] = shippingRates.map((e) => e.toJson()).toList();
    _data['shipping_address'] = shippingAddress.toJson();
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['items_count'] = itemsCount;
    _data['items_weight'] = itemsWeight;
    _data['needs_payment'] = needsPayment;
    _data['needs_shipping'] = needsShipping;
    _data['has_calculated_shipping'] = hasCalculatedShipping;
    _data['totals'] = totals.toJson();
    _data['errors'] = errors;
    _data['payment_requirements'] = paymentRequirements;
    _data['extensions'] = extensions.toJson();
    return _data;
  }
}

class Coupons {
  Coupons({
    required this.code,
    required this.totals,
  });
  late final String code;
  late final Totals totals;

  Coupons.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totals = Totals.fromJson(json['totals']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['totals'] = totals.toJson();
    return _data;
  }
}

class Totals {
  Totals({
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
    required this.totalDiscount,
    required this.totalDiscountTax,
  });
  late final String currencyCode;
  late final String currencySymbol;
  late final int currencyMinorUnit;
  late final String currencyDecimalSeparator;
  late final String currencyThousandSeparator;
  late final String currencyPrefix;
  late final String currencySuffix;
  late final String totalDiscount;
  late final String totalDiscountTax;

  Totals.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyMinorUnit = json['currency_minor_unit'];
    currencyDecimalSeparator = json['currency_decimal_separator'];
    currencyThousandSeparator = json['currency_thousand_separator'];
    currencyPrefix = json['currency_prefix'];
    currencySuffix = json['currency_suffix'];
    totalDiscount = json['total_discount'];
    totalDiscountTax = json['total_discount_tax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currency_code'] = currencyCode;
    _data['currency_symbol'] = currencySymbol;
    _data['currency_minor_unit'] = currencyMinorUnit;
    _data['currency_decimal_separator'] = currencyDecimalSeparator;
    _data['currency_thousand_separator'] = currencyThousandSeparator;
    _data['currency_prefix'] = currencyPrefix;
    _data['currency_suffix'] = currencySuffix;
    _data['total_discount'] = totalDiscount;
    _data['total_discount_tax'] = totalDiscountTax;
    return _data;
  }
}

class ShippingRates {
  ShippingRates({
    required this.packageId,
    required this.name,
    required this.destination,
    required this.items,
    required this.shippingRates,
  });
  late final int packageId;
  late final String name;
  late final Destination destination;
  late final List<Items> items;
  late final List<ShippingRates> shippingRates;

  ShippingRates.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    name = json['name'];
    destination = Destination.fromJson(json['destination']);
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    shippingRates = List.from(json['shipping_rates'])
        .map((e) => ShippingRates.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['package_id'] = packageId;
    _data['name'] = name;
    _data['destination'] = destination.toJson();
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['shipping_rates'] = shippingRates.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Destination {
  Destination({
    required this.address_1,
    required this.address_2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });
  late final String address_1;
  late final String address_2;
  late final String city;
  late final String state;
  late final String postcode;
  late final String country;

  Destination.fromJson(Map<String, dynamic> json) {
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    return _data;
  }
}

class Items {
  Items({
    required this.key,
    required this.name,
    required this.quantity,
  });
  late final String key;
  late final String name;
  late final int quantity;

  Items.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['name'] = name;
    _data['quantity'] = quantity;
    return _data;
  }
}

class ShippingAddress {
  ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address_1,
    required this.address_2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });
  late final String firstName;
  late final String lastName;
  late final String company;
  late final String address_1;
  late final String address_2;
  late final String city;
  late final String state;
  late final String postcode;
  late final String country;

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company'] = company;
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    return _data;
  }
}

class Extensions {
  Extensions();

  Extensions.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
