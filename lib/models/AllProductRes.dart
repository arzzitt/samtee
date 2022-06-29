/// id : 799
/// name : "Ship Your Idea"
/// slug : "ship-your-idea-22"
/// permalink : "https://example.com/product/ship-your-idea-22/"
/// date_created : "2017-03-23T17:03:12"
/// date_created_gmt : "2017-03-23T20:03:12"
/// date_modified : "2017-03-23T17:03:12"
/// date_modified_gmt : "2017-03-23T20:03:12"
/// type : "variable"
/// status : "publish"
/// featured : false
/// catalog_visibility : "visible"
/// description : "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n"
/// short_description : "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n"
/// sku : ""
/// price : ""
/// regular_price : ""
/// sale_price : ""
/// date_on_sale_from : null
/// date_on_sale_from_gmt : null
/// date_on_sale_to : null
/// date_on_sale_to_gmt : null
/// price_html : ""
/// on_sale : false
/// purchasable : false
/// total_sales : 0
/// virtual : false
/// downloadable : false
/// downloads : []
/// download_limit : -1
/// download_expiry : -1
/// external_url : ""
/// button_text : ""
/// tax_status : "taxable"
/// tax_class : ""
/// manage_stock : false
/// stock_quantity : null
/// stock_status : "instock"
/// backorders : "no"
/// backorders_allowed : false
/// backordered : false
/// sold_individually : false
/// weight : ""
/// dimensions : {"length":"","width":"","height":""}
/// shipping_required : true
/// shipping_taxable : true
/// shipping_class : ""
/// shipping_class_id : 0
/// reviews_allowed : true
/// average_rating : "0.00"
/// rating_count : 0
/// related_ids : [31,22,369,414,56]
/// upsell_ids : []
/// cross_sell_ids : []
/// parent_id : 0
/// purchase_note : ""
/// categories : [{"id":9,"name":"Clothing","slug":"clothing"},{"id":14,"name":"T-shirts","slug":"t-shirts"}]
/// tags : []
/// images : [{"id":795,"date_created":"2017-03-23T14:03:08","date_created_gmt":"2017-03-23T20:03:08","date_modified":"2017-03-23T14:03:08","date_modified_gmt":"2017-03-23T20:03:08","src":"https://example.com/wp-content/uploads/2017/03/T_4_front-11.jpg","name":"","alt":""},{"id":796,"date_created":"2017-03-23T14:03:09","date_created_gmt":"2017-03-23T20:03:09","date_modified":"2017-03-23T14:03:09","date_modified_gmt":"2017-03-23T20:03:09","src":"https://example.com/wp-content/uploads/2017/03/T_4_back-10.jpg","name":"","alt":""},{"id":797,"date_created":"2017-03-23T14:03:10","date_created_gmt":"2017-03-23T20:03:10","date_modified":"2017-03-23T14:03:10","date_modified_gmt":"2017-03-23T20:03:10","src":"https://example.com/wp-content/uploads/2017/03/T_3_front-10.jpg","name":"","alt":""},{"id":798,"date_created":"2017-03-23T14:03:11","date_created_gmt":"2017-03-23T20:03:11","date_modified":"2017-03-23T14:03:11","date_modified_gmt":"2017-03-23T20:03:11","src":"https://example.com/wp-content/uploads/2017/03/T_3_back-10.jpg","name":"","alt":""}]
/// attributes : [{"id":6,"name":"Color","position":0,"visible":false,"variation":true,"options":["Black","Green"]},{"id":0,"name":"Size","position":0,"visible":true,"variation":true,"options":["S","M"]}]
/// default_attributes : []
/// variations : []
/// grouped_products : []
/// menu_order : 0
/// meta_data : []
/// _links : {"self":[{"href":"https://example.com/wp-json/wc/v3/products/799"}],"collection":[{"href":"https://example.com/wp-json/wc/v3/products"}]}

class AllProductRes {
  AllProductRes({
      int? id, 
      String? name, 
      String? slug, 
      String? permalink, 
      String? dateCreated, 
      String? dateCreatedGmt, 
      String? dateModified, 
      String? dateModifiedGmt, 
      String? type, 
      String? status, 
      bool? featured, 
      String? catalogVisibility, 
      String? description, 
      String? shortDescription, 
      String? sku, 
      String? price, 
      String? regularPrice, 
      String? salePrice, 
      dynamic dateOnSaleFrom, 
      dynamic dateOnSaleFromGmt, 
      dynamic dateOnSaleTo, 
      dynamic dateOnSaleToGmt, 
      String? priceHtml, 
      bool? onSale, 
      bool? purchasable, 
      int? totalSales, 
      bool? virtual, 
      bool? downloadable, 
      List<dynamic>? downloads, 
      int? downloadLimit, 
      int? downloadExpiry, 
      String? externalUrl, 
      String? buttonText, 
      String? taxStatus, 
      String? taxClass, 
      bool? manageStock, 
      dynamic stockQuantity, 
      String? stockStatus, 
      String? backorders, 
      bool? backordersAllowed, 
      bool? backordered, 
      bool? soldIndividually, 
      String? weight, 
      Dimensions? dimensions, 
      bool? shippingRequired, 
      bool? shippingTaxable, 
      String? shippingClass, 
      int? shippingClassId, 
      bool? reviewsAllowed, 
      String? averageRating, 
      int? ratingCount, 
      List<int>? relatedIds, 
      List<dynamic>? upsellIds, 
      List<dynamic>? crossSellIds, 
      int? parentId, 
      String? purchaseNote, 
      List<Categories>? categories, 
      List<dynamic>? tags, 
      List<Images>? images, 
      List<Attributes>? attributes, 
      List<dynamic>? defaultAttributes, 
      List<dynamic>? variations, 
      List<dynamic>? groupedProducts, 
      int? menuOrder, 
      List<dynamic>? metaData, 
      Links? links,}){
    _id = id;
    _name = name;
    _slug = slug;
    _permalink = permalink;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _type = type;
    _status = status;
    _featured = featured;
    _catalogVisibility = catalogVisibility;
    _description = description;
    _shortDescription = shortDescription;
    _sku = sku;
    _price = price;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _dateOnSaleFrom = dateOnSaleFrom;
    _dateOnSaleFromGmt = dateOnSaleFromGmt;
    _dateOnSaleTo = dateOnSaleTo;
    _dateOnSaleToGmt = dateOnSaleToGmt;
    _priceHtml = priceHtml;
    _onSale = onSale;
    _purchasable = purchasable;
    _totalSales = totalSales;
    _virtual = virtual;
    _downloadable = downloadable;
    _downloads = downloads;
    _downloadLimit = downloadLimit;
    _downloadExpiry = downloadExpiry;
    _externalUrl = externalUrl;
    _buttonText = buttonText;
    _taxStatus = taxStatus;
    _taxClass = taxClass;
    _manageStock = manageStock;
    _stockQuantity = stockQuantity;
    _stockStatus = stockStatus;
    _backorders = backorders;
    _backordersAllowed = backordersAllowed;
    _backordered = backordered;
    _soldIndividually = soldIndividually;
    _weight = weight;
    _dimensions = dimensions;
    _shippingRequired = shippingRequired;
    _shippingTaxable = shippingTaxable;
    _shippingClass = shippingClass;
    _shippingClassId = shippingClassId;
    _reviewsAllowed = reviewsAllowed;
    _averageRating = averageRating;
    _ratingCount = ratingCount;
    _relatedIds = relatedIds;
    _upsellIds = upsellIds;
    _crossSellIds = crossSellIds;
    _parentId = parentId;
    _purchaseNote = purchaseNote;
    _categories = categories;
    _tags = tags;
    _images = images;
    _attributes = attributes;
    _defaultAttributes = defaultAttributes;
    _variations = variations;
    _groupedProducts = groupedProducts;
    _menuOrder = menuOrder;
    _metaData = metaData;
    _links = links;
}

  AllProductRes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _permalink = json['permalink'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _type = json['type'];
    _status = json['status'];
    _featured = json['featured'];
    _catalogVisibility = json['catalog_visibility'];
    _description = json['description'];
    _shortDescription = json['short_description'];
    _sku = json['sku'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _dateOnSaleFrom = json['date_on_sale_from'];
    _dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    _dateOnSaleTo = json['date_on_sale_to'];
    _dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    _priceHtml = json['price_html'];
    _onSale = json['on_sale'];
    _purchasable = json['purchasable'];
    _totalSales = int.parse(json['total_sales'].toString());
    _virtual = json['virtual'];
    _downloadable = json['downloadable'];
    // if (json['downloads'] != null) {
    //   _downloads = [];
    //   json['downloads'].forEach((v) {
    //     _downloads?.add(Dynamic.fromJson(v));
    //   });
    // }
    _downloadLimit = json['download_limit'];
    _downloadExpiry = json['download_expiry'];
    _externalUrl = json['external_url'];
    _buttonText = json['button_text'];
    _taxStatus = json['tax_status'];
    _taxClass = json['tax_class'];
    _manageStock = json['manage_stock'];
    _stockQuantity = json['stock_quantity'];
    _stockStatus = json['stock_status'];
    _backorders = json['backorders'];
    _backordersAllowed = json['backorders_allowed'];
    _backordered = json['backordered'];
    _soldIndividually = json['sold_individually'];
    _weight = json['weight'];
    _dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    _shippingRequired = json['shipping_required'];
    _shippingTaxable = json['shipping_taxable'];
    _shippingClass = json['shipping_class'];
    _shippingClassId = json['shipping_class_id'];
    _reviewsAllowed = json['reviews_allowed'];
    _averageRating = json['average_rating'];
    _ratingCount = json['rating_count'];
    _relatedIds = json['related_ids'] != null ? json['related_ids'].cast<int>() : [];
    // if (json['upsell_ids'] != null) {
    //   _upsellIds = [];
    //   json['upsell_ids'].forEach((v) {
    //     _upsellIds?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['cross_sell_ids'] != null) {
    //   _crossSellIds = [];
    //   json['cross_sell_ids'].forEach((v) {
    //     _crossSellIds?.add(Dynamic.fromJson(v));
    //   });
    // }
    _parentId = json['parent_id'];
    _purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    // if (json['tags'] != null) {
    //   _tags = [];
    //   json['tags'].forEach((v) {
    //     _tags?.add(Dynamic.fromJson(v));
    //   });
    // }
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    // if (json['default_attributes'] != null) {
    //   _defaultAttributes = [];
    //   json['default_attributes'].forEach((v) {
    //     _defaultAttributes?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['variations'] != null) {
    //   _variations = [];
    //   json['variations'].forEach((v) {
    //     _variations?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['grouped_products'] != null) {
    //   _groupedProducts = [];
    //   json['grouped_products'].forEach((v) {
    //     _groupedProducts?.add(Dynamic.fromJson(v));
    //   });
    // }
    _menuOrder = json['menu_order'];
    // if (json['meta_data'] != null) {
    //   _metaData = [];
    //   json['meta_data'].forEach((v) {
    //     _metaData?.add(Dynamic.fromJson(v));
    //   });
    // }
    _links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? _id;
  String? _name;
  String? _slug;
  String? _permalink;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _type;
  String? _status;
  bool? _featured;
  String? _catalogVisibility;
  String? _description;
  String? _shortDescription;
  String? _sku;
  String? _price;
  String? _regularPrice;
  String? _salePrice;
  dynamic _dateOnSaleFrom;
  dynamic _dateOnSaleFromGmt;
  dynamic _dateOnSaleTo;
  dynamic _dateOnSaleToGmt;
  String? _priceHtml;
  bool? _onSale;
  bool? _purchasable;
  int? _totalSales;
  bool? _virtual;
  bool? _downloadable;
  List<dynamic>? _downloads;
  int? _downloadLimit;
  int? _downloadExpiry;
  String? _externalUrl;
  String? _buttonText;
  String? _taxStatus;
  String? _taxClass;
  bool? _manageStock;
  dynamic _stockQuantity;
  String? _stockStatus;
  String? _backorders;
  bool? _backordersAllowed;
  bool? _backordered;
  bool? _soldIndividually;
  String? _weight;
  Dimensions? _dimensions;
  bool? _shippingRequired;
  bool? _shippingTaxable;
  String? _shippingClass;
  int? _shippingClassId;
  bool? _reviewsAllowed;
  String? _averageRating;
  int? _ratingCount;
  List<int>? _relatedIds;
  List<dynamic>? _upsellIds;
  List<dynamic>? _crossSellIds;
  int? _parentId;
  String? _purchaseNote;
  List<Categories>? _categories;
  List<dynamic>? _tags;
  List<Images>? _images;
  List<Attributes>? _attributes;
  List<dynamic>? _defaultAttributes;
  List<dynamic>? _variations;
  List<dynamic>? _groupedProducts;
  int? _menuOrder;
  List<dynamic>? _metaData;
  Links? _links;
AllProductRes copyWith({  int? id,
  String? name,
  String? slug,
  String? permalink,
  String? dateCreated,
  String? dateCreatedGmt,
  String? dateModified,
  String? dateModifiedGmt,
  String? type,
  String? status,
  bool? featured,
  String? catalogVisibility,
  String? description,
  String? shortDescription,
  String? sku,
  String? price,
  String? regularPrice,
  String? salePrice,
  dynamic dateOnSaleFrom,
  dynamic dateOnSaleFromGmt,
  dynamic dateOnSaleTo,
  dynamic dateOnSaleToGmt,
  String? priceHtml,
  bool? onSale,
  bool? purchasable,
  int? totalSales,
  bool? virtual,
  bool? downloadable,
  List<dynamic>? downloads,
  int? downloadLimit,
  int? downloadExpiry,
  String? externalUrl,
  String? buttonText,
  String? taxStatus,
  String? taxClass,
  bool? manageStock,
  dynamic stockQuantity,
  String? stockStatus,
  String? backorders,
  bool? backordersAllowed,
  bool? backordered,
  bool? soldIndividually,
  String? weight,
  Dimensions? dimensions,
  bool? shippingRequired,
  bool? shippingTaxable,
  String? shippingClass,
  int? shippingClassId,
  bool? reviewsAllowed,
  String? averageRating,
  int? ratingCount,
  List<int>? relatedIds,
  List<dynamic>? upsellIds,
  List<dynamic>? crossSellIds,
  int? parentId,
  String? purchaseNote,
  List<Categories>? categories,
  List<dynamic>? tags,
  List<Images>? images,
  List<Attributes>? attributes,
  List<dynamic>? defaultAttributes,
  List<dynamic>? variations,
  List<dynamic>? groupedProducts,
  int? menuOrder,
  List<dynamic>? metaData,
  Links? links,
}) => AllProductRes(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  permalink: permalink ?? _permalink,
  dateCreated: dateCreated ?? _dateCreated,
  dateCreatedGmt: dateCreatedGmt ?? _dateCreatedGmt,
  dateModified: dateModified ?? _dateModified,
  dateModifiedGmt: dateModifiedGmt ?? _dateModifiedGmt,
  type: type ?? _type,
  status: status ?? _status,
  featured: featured ?? _featured,
  catalogVisibility: catalogVisibility ?? _catalogVisibility,
  description: description ?? _description,
  shortDescription: shortDescription ?? _shortDescription,
  sku: sku ?? _sku,
  price: price ?? _price,
  regularPrice: regularPrice ?? _regularPrice,
  salePrice: salePrice ?? _salePrice,
  dateOnSaleFrom: dateOnSaleFrom ?? _dateOnSaleFrom,
  dateOnSaleFromGmt: dateOnSaleFromGmt ?? _dateOnSaleFromGmt,
  dateOnSaleTo: dateOnSaleTo ?? _dateOnSaleTo,
  dateOnSaleToGmt: dateOnSaleToGmt ?? _dateOnSaleToGmt,
  priceHtml: priceHtml ?? _priceHtml,
  onSale: onSale ?? _onSale,
  purchasable: purchasable ?? _purchasable,
  totalSales: totalSales ?? _totalSales,
  virtual: virtual ?? _virtual,
  downloadable: downloadable ?? _downloadable,
  downloads: downloads ?? _downloads,
  downloadLimit: downloadLimit ?? _downloadLimit,
  downloadExpiry: downloadExpiry ?? _downloadExpiry,
  externalUrl: externalUrl ?? _externalUrl,
  buttonText: buttonText ?? _buttonText,
  taxStatus: taxStatus ?? _taxStatus,
  taxClass: taxClass ?? _taxClass,
  manageStock: manageStock ?? _manageStock,
  stockQuantity: stockQuantity ?? _stockQuantity,
  stockStatus: stockStatus ?? _stockStatus,
  backorders: backorders ?? _backorders,
  backordersAllowed: backordersAllowed ?? _backordersAllowed,
  backordered: backordered ?? _backordered,
  soldIndividually: soldIndividually ?? _soldIndividually,
  weight: weight ?? _weight,
  dimensions: dimensions ?? _dimensions,
  shippingRequired: shippingRequired ?? _shippingRequired,
  shippingTaxable: shippingTaxable ?? _shippingTaxable,
  shippingClass: shippingClass ?? _shippingClass,
  shippingClassId: shippingClassId ?? _shippingClassId,
  reviewsAllowed: reviewsAllowed ?? _reviewsAllowed,
  averageRating: averageRating ?? _averageRating,
  ratingCount: ratingCount ?? _ratingCount,
  relatedIds: relatedIds ?? _relatedIds,
  upsellIds: upsellIds ?? _upsellIds,
  crossSellIds: crossSellIds ?? _crossSellIds,
  parentId: parentId ?? _parentId,
  purchaseNote: purchaseNote ?? _purchaseNote,
  categories: categories ?? _categories,
  tags: tags ?? _tags,
  images: images ?? _images,
  attributes: attributes ?? _attributes,
  defaultAttributes: defaultAttributes ?? _defaultAttributes,
  variations: variations ?? _variations,
  groupedProducts: groupedProducts ?? _groupedProducts,
  menuOrder: menuOrder ?? _menuOrder,
  metaData: metaData ?? _metaData,
  links: links ?? _links,
);
  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get permalink => _permalink;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get type => _type;
  String? get status => _status;
  bool? get featured => _featured;
  String? get catalogVisibility => _catalogVisibility;
  String? get description => _description;
  String? get shortDescription => _shortDescription;
  String? get sku => _sku;
  String? get price => _price;
  String? get regularPrice => _regularPrice;
  String? get salePrice => _salePrice;
  dynamic get dateOnSaleFrom => _dateOnSaleFrom;
  dynamic get dateOnSaleFromGmt => _dateOnSaleFromGmt;
  dynamic get dateOnSaleTo => _dateOnSaleTo;
  dynamic get dateOnSaleToGmt => _dateOnSaleToGmt;
  String? get priceHtml => _priceHtml;
  bool? get onSale => _onSale;
  bool? get purchasable => _purchasable;
  int? get totalSales => _totalSales;
  bool? get virtual => _virtual;
  bool? get downloadable => _downloadable;
  List<dynamic>? get downloads => _downloads;
  int? get downloadLimit => _downloadLimit;
  int? get downloadExpiry => _downloadExpiry;
  String? get externalUrl => _externalUrl;
  String? get buttonText => _buttonText;
  String? get taxStatus => _taxStatus;
  String? get taxClass => _taxClass;
  bool? get manageStock => _manageStock;
  dynamic get stockQuantity => _stockQuantity;
  String? get stockStatus => _stockStatus;
  String? get backorders => _backorders;
  bool? get backordersAllowed => _backordersAllowed;
  bool? get backordered => _backordered;
  bool? get soldIndividually => _soldIndividually;
  String? get weight => _weight;
  Dimensions? get dimensions => _dimensions;
  bool? get shippingRequired => _shippingRequired;
  bool? get shippingTaxable => _shippingTaxable;
  String? get shippingClass => _shippingClass;
  int? get shippingClassId => _shippingClassId;
  bool? get reviewsAllowed => _reviewsAllowed;
  String? get averageRating => _averageRating;
  int? get ratingCount => _ratingCount;
  List<int>? get relatedIds => _relatedIds;
  List<dynamic>? get upsellIds => _upsellIds;
  List<dynamic>? get crossSellIds => _crossSellIds;
  int? get parentId => _parentId;
  String? get purchaseNote => _purchaseNote;
  List<Categories>? get categories => _categories;
  List<dynamic>? get tags => _tags;
  List<Images>? get images => _images;
  List<Attributes>? get attributes => _attributes;
  List<dynamic>? get defaultAttributes => _defaultAttributes;
  List<dynamic>? get variations => _variations;
  List<dynamic>? get groupedProducts => _groupedProducts;
  int? get menuOrder => _menuOrder;
  List<dynamic>? get metaData => _metaData;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['permalink'] = _permalink;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['type'] = _type;
    map['status'] = _status;
    map['featured'] = _featured;
    map['catalog_visibility'] = _catalogVisibility;
    map['description'] = _description;
    map['short_description'] = _shortDescription;
    map['sku'] = _sku;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['date_on_sale_from'] = _dateOnSaleFrom;
    map['date_on_sale_from_gmt'] = _dateOnSaleFromGmt;
    map['date_on_sale_to'] = _dateOnSaleTo;
    map['date_on_sale_to_gmt'] = _dateOnSaleToGmt;
    map['price_html'] = _priceHtml;
    map['on_sale'] = _onSale;
    map['purchasable'] = _purchasable;
    map['total_sales'] = _totalSales;
    map['virtual'] = _virtual;
    map['downloadable'] = _downloadable;
    if (_downloads != null) {
      map['downloads'] = _downloads?.map((v) => v.toJson()).toList();
    }
    map['download_limit'] = _downloadLimit;
    map['download_expiry'] = _downloadExpiry;
    map['external_url'] = _externalUrl;
    map['button_text'] = _buttonText;
    map['tax_status'] = _taxStatus;
    map['tax_class'] = _taxClass;
    map['manage_stock'] = _manageStock;
    map['stock_quantity'] = _stockQuantity;
    map['stock_status'] = _stockStatus;
    map['backorders'] = _backorders;
    map['backorders_allowed'] = _backordersAllowed;
    map['backordered'] = _backordered;
    map['sold_individually'] = _soldIndividually;
    map['weight'] = _weight;
    if (_dimensions != null) {
      map['dimensions'] = _dimensions?.toJson();
    }
    map['shipping_required'] = _shippingRequired;
    map['shipping_taxable'] = _shippingTaxable;
    map['shipping_class'] = _shippingClass;
    map['shipping_class_id'] = _shippingClassId;
    map['reviews_allowed'] = _reviewsAllowed;
    map['average_rating'] = _averageRating;
    map['rating_count'] = _ratingCount;
    map['related_ids'] = _relatedIds;
    if (_upsellIds != null) {
      map['upsell_ids'] = _upsellIds?.map((v) => v.toJson()).toList();
    }
    if (_crossSellIds != null) {
      map['cross_sell_ids'] = _crossSellIds?.map((v) => v.toJson()).toList();
    }
    map['parent_id'] = _parentId;
    map['purchase_note'] = _purchaseNote;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_defaultAttributes != null) {
      map['default_attributes'] = _defaultAttributes?.map((v) => v.toJson()).toList();
    }
    if (_variations != null) {
      map['variations'] = _variations?.map((v) => v.toJson()).toList();
    }
    if (_groupedProducts != null) {
      map['grouped_products'] = _groupedProducts?.map((v) => v.toJson()).toList();
    }
    map['menu_order'] = _menuOrder;
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['_links'] = _links?.toJson();
    }
    return map;
  }

}

/// self : [{"href":"https://example.com/wp-json/wc/v3/products/799"}]
/// collection : [{"href":"https://example.com/wp-json/wc/v3/products"}]

class Links {
  Links({
      List<Self>? self, 
      List<Collection>? collection,}){
    _self = self;
    _collection = collection;
}

  Links.fromJson(dynamic json) {
    if (json['self'] != null) {
      _self = [];
      json['self'].forEach((v) {
        _self?.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      _collection = [];
      json['collection'].forEach((v) {
        _collection?.add(Collection.fromJson(v));
      });
    }
  }
  List<Self>? _self;
  List<Collection>? _collection;
Links copyWith({  List<Self>? self,
  List<Collection>? collection,
}) => Links(  self: self ?? _self,
  collection: collection ?? _collection,
);
  List<Self>? get self => _self;
  List<Collection>? get collection => _collection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_self != null) {
      map['self'] = _self?.map((v) => v.toJson()).toList();
    }
    if (_collection != null) {
      map['collection'] = _collection?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// href : "https://example.com/wp-json/wc/v3/products"

class Collection {
  Collection({
      String? href,}){
    _href = href;
}

  Collection.fromJson(dynamic json) {
    _href = json['href'];
  }
  String? _href;
Collection copyWith({  String? href,
}) => Collection(  href: href ?? _href,
);
  String? get href => _href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = _href;
    return map;
  }

}

/// href : "https://example.com/wp-json/wc/v3/products/799"

class Self {
  Self({
      String? href,}){
    _href = href;
}

  Self.fromJson(dynamic json) {
    _href = json['href'];
  }
  String? _href;
Self copyWith({  String? href,
}) => Self(  href: href ?? _href,
);
  String? get href => _href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = _href;
    return map;
  }

}

/// id : 6
/// name : "Color"
/// position : 0
/// visible : false
/// variation : true
/// options : ["Black","Green"]

class Attributes {
  Attributes({
      int? id, 
      String? name, 
      int? position, 
      bool? visible, 
      bool? variation, 
      List<String>? options,}){
    _id = id;
    _name = name;
    _position = position;
    _visible = visible;
    _variation = variation;
    _options = options;
}

  Attributes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _position = json['position'];
    _visible = json['visible'];
    _variation = json['variation'];
    _options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  int? _id;
  String? _name;
  int? _position;
  bool? _visible;
  bool? _variation;
  List<String>? _options;
Attributes copyWith({  int? id,
  String? name,
  int? position,
  bool? visible,
  bool? variation,
  List<String>? options,
}) => Attributes(  id: id ?? _id,
  name: name ?? _name,
  position: position ?? _position,
  visible: visible ?? _visible,
  variation: variation ?? _variation,
  options: options ?? _options,
);
  int? get id => _id;
  String? get name => _name;
  int? get position => _position;
  bool? get visible => _visible;
  bool? get variation => _variation;
  List<String>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['position'] = _position;
    map['visible'] = _visible;
    map['variation'] = _variation;
    map['options'] = _options;
    return map;
  }

}

/// id : 795
/// date_created : "2017-03-23T14:03:08"
/// date_created_gmt : "2017-03-23T20:03:08"
/// date_modified : "2017-03-23T14:03:08"
/// date_modified_gmt : "2017-03-23T20:03:08"
/// src : "https://example.com/wp-content/uploads/2017/03/T_4_front-11.jpg"
/// name : ""
/// alt : ""

class Images {
  Images({
      int? id, 
      String? dateCreated, 
      String? dateCreatedGmt, 
      String? dateModified, 
      String? dateModifiedGmt, 
      String? src, 
      String? name, 
      String? alt,}){
    _id = id;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _src = src;
    _name = name;
    _alt = alt;
}

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _src = json['src'];
    _name = json['name'];
    _alt = json['alt'];
  }
  int? _id;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _src;
  String? _name;
  String? _alt;
Images copyWith({  int? id,
  String? dateCreated,
  String? dateCreatedGmt,
  String? dateModified,
  String? dateModifiedGmt,
  String? src,
  String? name,
  String? alt,
}) => Images(  id: id ?? _id,
  dateCreated: dateCreated ?? _dateCreated,
  dateCreatedGmt: dateCreatedGmt ?? _dateCreatedGmt,
  dateModified: dateModified ?? _dateModified,
  dateModifiedGmt: dateModifiedGmt ?? _dateModifiedGmt,
  src: src ?? _src,
  name: name ?? _name,
  alt: alt ?? _alt,
);
  int? get id => _id;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get src => _src;
  String? get name => _name;
  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['src'] = _src;
    map['name'] = _name;
    map['alt'] = _alt;
    return map;
  }

}

/// id : 9
/// name : "Clothing"
/// slug : "clothing"

class Categories {
  Categories({
      int? id, 
      String? name, 
      String? slug,}){
    _id = id;
    _name = name;
    _slug = slug;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  int? _id;
  String? _name;
  String? _slug;
Categories copyWith({  int? id,
  String? name,
  String? slug,
}) => Categories(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
);
  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }

}

/// length : ""
/// width : ""
/// height : ""

class Dimensions {
  Dimensions({
      String? length, 
      String? width, 
      String? height,}){
    _length = length;
    _width = width;
    _height = height;
}

  Dimensions.fromJson(dynamic json) {
    _length = json['length'];
    _width = json['width'];
    _height = json['height'];
  }
  String? _length;
  String? _width;
  String? _height;
Dimensions copyWith({  String? length,
  String? width,
  String? height,
}) => Dimensions(  length: length ?? _length,
  width: width ?? _width,
  height: height ?? _height,
);
  String? get length => _length;
  String? get width => _width;
  String? get height => _height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = _length;
    map['width'] = _width;
    map['height'] = _height;
    return map;
  }

}