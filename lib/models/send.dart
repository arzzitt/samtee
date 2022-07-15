/// payment_method : "bacs"
/// payment_method_title : "Direct Bank Transfer"
/// set_paid : true
/// billing : {"first_name":"John","last_name":"Doe","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"john.doe@example.com","phone":"(555) 555-5555"}
/// shipping : {"first_name":"John","last_name":"Doe","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US"}
/// line_items : [{"product_id":93,"quantity":2},{"product_id":22,"variation_id":23,"quantity":1}]
/// shipping_lines : [{"method_id":"flat_rate","method_title":"Flat Rate","total":"10.00"}]

class Send {
  Send({
      String? paymentMethod, 
      String? paymentMethodTitle, 
      bool? setPaid, 
      Billing? billing, 
      Shipping? shipping, 
      List<LineItems>? lineItems, 
      List<ShippingLines>? shippingLines,}){
    _paymentMethod = paymentMethod;
    _paymentMethodTitle = paymentMethodTitle;
    _setPaid = setPaid;
    _billing = billing;
    _shipping = shipping;
    _lineItems = lineItems;
    _shippingLines = shippingLines;
}

  Send.fromJson(dynamic json) {
    _paymentMethod = json['payment_method'];
    _paymentMethodTitle = json['payment_method_title'];
    _setPaid = json['set_paid'];
    _billing = json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    _shipping = json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    if (json['line_items'] != null) {
      _lineItems = [];
      json['line_items'].forEach((v) {
        _lineItems?.add(LineItems.fromJson(v));
      });
    }
    if (json['shipping_lines'] != null) {
      _shippingLines = [];
      json['shipping_lines'].forEach((v) {
        _shippingLines?.add(ShippingLines.fromJson(v));
      });
    }
  }
  String? _paymentMethod;
  String? _paymentMethodTitle;
  bool? _setPaid;
  Billing? _billing;
  Shipping? _shipping;
  List<LineItems>? _lineItems;
  List<ShippingLines>? _shippingLines;
Send copyWith({  String? paymentMethod,
  String? paymentMethodTitle,
  bool? setPaid,
  Billing? billing,
  Shipping? shipping,
  List<LineItems>? lineItems,
  List<ShippingLines>? shippingLines,
}) => Send(  paymentMethod: paymentMethod ?? _paymentMethod,
  paymentMethodTitle: paymentMethodTitle ?? _paymentMethodTitle,
  setPaid: setPaid ?? _setPaid,
  billing: billing ?? _billing,
  shipping: shipping ?? _shipping,
  lineItems: lineItems ?? _lineItems,
  shippingLines: shippingLines ?? _shippingLines,
);
  String? get paymentMethod => _paymentMethod;
  String? get paymentMethodTitle => _paymentMethodTitle;
  bool? get setPaid => _setPaid;
  Billing? get billing => _billing;
  Shipping? get shipping => _shipping;
  List<LineItems>? get lineItems => _lineItems;
  List<ShippingLines>? get shippingLines => _shippingLines;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_method'] = _paymentMethod;
    map['payment_method_title'] = _paymentMethodTitle;
    map['set_paid'] = _setPaid;
    if (_billing != null) {
      map['billing'] = _billing?.toJson();
    }
    if (_shipping != null) {
      map['shipping'] = _shipping?.toJson();
    }
    if (_lineItems != null) {
      map['line_items'] = _lineItems?.map((v) => v.toJson()).toList();
    }
    if (_shippingLines != null) {
      map['shipping_lines'] = _shippingLines?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// method_id : "flat_rate"
/// method_title : "Flat Rate"
/// total : "10.00"

class ShippingLines {
  ShippingLines({
      String? methodId, 
      String? methodTitle, 
      String? total,}){
    _methodId = methodId;
    _methodTitle = methodTitle;
    _total = total;
}

  ShippingLines.fromJson(dynamic json) {
    _methodId = json['method_id'];
    _methodTitle = json['method_title'];
    _total = json['total'];
  }
  String? _methodId;
  String? _methodTitle;
  String? _total;
ShippingLines copyWith({  String? methodId,
  String? methodTitle,
  String? total,
}) => ShippingLines(  methodId: methodId ?? _methodId,
  methodTitle: methodTitle ?? _methodTitle,
  total: total ?? _total,
);
  String? get methodId => _methodId;
  String? get methodTitle => _methodTitle;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['method_id'] = _methodId;
    map['method_title'] = _methodTitle;
    map['total'] = _total;
    return map;
  }

}

/// product_id : 93
/// quantity : 2

class LineItems {
  LineItems({
      int? productId, 
      int? quantity,}){
    _productId = productId;
    _quantity = quantity;
}

  LineItems.fromJson(dynamic json) {
    _productId = json['product_id'];
    _quantity = json['quantity'];
  }
  int? _productId;
  int? _quantity;
LineItems copyWith({  int? productId,
  int? quantity,
}) => LineItems(  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
);
  int? get productId => _productId;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }

}

/// first_name : "John"
/// last_name : "Doe"
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"

class Shipping {
  Shipping({
      String? firstName, 
      String? lastName, 
      String? address1, 
      String? address2, 
      String? city, 
      String? state, 
      String? postcode, 
      String? country,}){
    _firstName = firstName;
    _lastName = lastName;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
}

  Shipping.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
  }
  String? _firstName;
  String? _lastName;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;
Shipping copyWith({  String? firstName,
  String? lastName,
  String? address1,
  String? address2,
  String? city,
  String? state,
  String? postcode,
  String? country,
}) => Shipping(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  city: city ?? _city,
  state: state ?? _state,
  postcode: postcode ?? _postcode,
  country: country ?? _country,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    return map;
  }

}

/// first_name : "John"
/// last_name : "Doe"
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"
/// email : "john.doe@example.com"
/// phone : "(555) 555-5555"

class Billing {
  Billing({
      String? firstName, 
      String? lastName, 
      String? address1, 
      String? address2, 
      String? city, 
      String? state, 
      String? postcode, 
      String? country, 
      String? email, 
      String? phone,}){
    _firstName = firstName;
    _lastName = lastName;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
    _email = email;
    _phone = phone;
}

  Billing.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _firstName;
  String? _lastName;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;
  String? _email;
  String? _phone;
Billing copyWith({  String? firstName,
  String? lastName,
  String? address1,
  String? address2,
  String? city,
  String? state,
  String? postcode,
  String? country,
  String? email,
  String? phone,
}) => Billing(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  city: city ?? _city,
  state: state ?? _state,
  postcode: postcode ?? _postcode,
  country: country ?? _country,
  email: email ?? _email,
  phone: phone ?? _phone,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

}