class Order {
  Order({
    required this.id,
    required this.parentId,
    required this.status,
    required this.currency,
    required this.version,
    required this.pricesIncludeTax,
    required this.dateCreated,
    required this.dateModified,
    required this.discountTotal,
    required this.discountTax,
    required this.shippingTotal,
    required this.shippingTax,
    required this.cartTax,
    required this.total,
    required this.totalTax,
    required this.customerId,
    required this.orderKey,
    required this.billing,
    required this.shipping,
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.transactionId,
    required this.customerIpAddress,
    required this.customerUserAgent,
    required this.createdVia,
    required this.customerNote,
    this.dateCompleted,
    this.datePaid,
    required this.cartHash,
    required this.number,
    required this.metaData,
    required this.lineItems,
    required this.taxLines,
    required this.shippingLines,
    required this.feeLines,
    required this.couponLines,
    required this.refunds,
    required this.paymentUrl,
    required this.dateCreatedGmt,
    required this.dateModifiedGmt,
    this.dateCompletedGmt,
    this.datePaidGmt,
    required this.currencySymbol,
    required this.links,
  });
  late final int id;
  late final int parentId;
  late final String status;
  late final String currency;
  late final String version;
  late final bool pricesIncludeTax;
  late final String dateCreated;
  late final String dateModified;
  late final String discountTotal;
  late final String discountTax;
  late final String shippingTotal;
  late final String shippingTax;
  late final String cartTax;
  late final String total;
  late final String totalTax;
  late final int customerId;
  late final String orderKey;
  late final Billing billing;
  late final Shipping shipping;
  late final String paymentMethod;
  late final String paymentMethodTitle;
  late final String transactionId;
  late final String customerIpAddress;
  late final String customerUserAgent;
  late final String createdVia;
  late final String customerNote;
  late final Null dateCompleted;
  late final Null datePaid;
  late final String cartHash;
  late final String number;
  late final List<dynamic> metaData;
  late final List<dynamic> lineItems;
  late final List<dynamic> taxLines;
  late final List<dynamic> shippingLines;
  late final List<dynamic> feeLines;
  late final List<dynamic> couponLines;
  late final List<dynamic> refunds;
  late final String paymentUrl;
  late final String dateCreatedGmt;
  late final String dateModifiedGmt;
  late final Null dateCompletedGmt;
  late final Null datePaidGmt;
  late final String currencySymbol;
  late final _links links;

  Order.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parent_id'];
    status = json['status'];
    currency = json['currency'];
    version = json['version'];
    pricesIncludeTax = json['prices_include_tax'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    discountTotal = json['discount_total'];
    discountTax = json['discount_tax'];
    shippingTotal = json['shipping_total'];
    shippingTax = json['shipping_tax'];
    cartTax = json['cart_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    customerId = json['customer_id'];
    orderKey = json['order_key'];
    billing = Billing.fromJson(json['billing']);
    shipping = Shipping.fromJson(json['shipping']);
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    transactionId = json['transaction_id'];
    customerIpAddress = json['customer_ip_address'];
    customerUserAgent = json['customer_user_agent'];
    createdVia = json['created_via'];
    customerNote = json['customer_note'];
    dateCompleted = null;
    datePaid = null;
    cartHash = json['cart_hash'];
    number = json['number'];
    metaData = List.castFrom<dynamic, dynamic>(json['meta_data']);
    lineItems = List.castFrom<dynamic, dynamic>(json['line_items']);
    taxLines = List.castFrom<dynamic, dynamic>(json['tax_lines']);
    shippingLines = List.castFrom<dynamic, dynamic>(json['shipping_lines']);
    feeLines = List.castFrom<dynamic, dynamic>(json['fee_lines']);
    couponLines = List.castFrom<dynamic, dynamic>(json['coupon_lines']);
    refunds = List.castFrom<dynamic, dynamic>(json['refunds']);
    paymentUrl = json['payment_url'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModifiedGmt = json['date_modified_gmt'];
    dateCompletedGmt = null;
    datePaidGmt = null;
    currencySymbol = json['currency_symbol'];
    links = _links.fromJson(json['_links']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['status'] = status;
    _data['currency'] = currency;
    _data['version'] = version;
    _data['prices_include_tax'] = pricesIncludeTax;
    _data['date_created'] = dateCreated;
    _data['date_modified'] = dateModified;
    _data['discount_total'] = discountTotal;
    _data['discount_tax'] = discountTax;
    _data['shipping_total'] = shippingTotal;
    _data['shipping_tax'] = shippingTax;
    _data['cart_tax'] = cartTax;
    _data['total'] = total;
    _data['total_tax'] = totalTax;
    _data['customer_id'] = customerId;
    _data['order_key'] = orderKey;
    _data['billing'] = billing.toJson();
    _data['shipping'] = shipping.toJson();
    _data['payment_method'] = paymentMethod;
    _data['payment_method_title'] = paymentMethodTitle;
    _data['transaction_id'] = transactionId;
    _data['customer_ip_address'] = customerIpAddress;
    _data['customer_user_agent'] = customerUserAgent;
    _data['created_via'] = createdVia;
    _data['customer_note'] = customerNote;
    _data['date_completed'] = dateCompleted;
    _data['date_paid'] = datePaid;
    _data['cart_hash'] = cartHash;
    _data['number'] = number;
    _data['meta_data'] = metaData;
    _data['line_items'] = lineItems;
    _data['tax_lines'] = taxLines;
    _data['shipping_lines'] = shippingLines;
    _data['fee_lines'] = feeLines;
    _data['coupon_lines'] = couponLines;
    _data['refunds'] = refunds;
    _data['payment_url'] = paymentUrl;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['date_completed_gmt'] = dateCompletedGmt;
    _data['date_paid_gmt'] = datePaidGmt;
    _data['currency_symbol'] = currencySymbol;
    _data['_links'] = links.toJson();
    return _data;
  }
}

class Billing {
  Billing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address_1,
    required this.address_2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.email,
    required this.phone,
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
  late final String email;
  late final String phone;

  Billing.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
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
    _data['email'] = email;
    _data['phone'] = phone;
    return _data;
  }
}

class Shipping {
  Shipping({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address_1,
    required this.address_2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.phone,
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
  late final String phone;

  Shipping.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    phone = json['phone'];
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
    _data['phone'] = phone;
    return _data;
  }
}

class _links {
  _links({
    required this.self,
    required this.collection,
  });
  late final List<Self> self;
  late final List<Collection> collection;

  _links.fromJson(Map<String, dynamic> json){
    self = List.from(json['self']).map((e)=>Self.fromJson(e)).toList();
    collection = List.from(json['collection']).map((e)=>Collection.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self.map((e)=>e.toJson()).toList();
    _data['collection'] = collection.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Self {
  Self({
    required this.href,
  });
  late final String href;

  Self.fromJson(Map<String, dynamic> json){
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}

class Collection {
  Collection({
    required this.href,
  });
  late final String href;

  Collection.fromJson(Map<String, dynamic> json){
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}