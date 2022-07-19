/// id : 34
/// name : "Accessories"
/// slug : "accessories"
/// parent : 0
/// description : ""
/// display : "default"
/// image : null
/// menu_order : 0
/// count : 5
/// _links : {"self":[{"href":"https://santee.phaico.com/wp-json/wc/v3/products/categories/34"}],"collection":[{"href":"https://santee.phaico.com/wp-json/wc/v3/products/categories"}]}

class AllCategoryList {
  AllCategoryList({
      int? id, 
      String? name, 
      String? slug, 
      int? parent, 
      String? description, 
      String? display, 
      String? image,
      int? menuOrder, 
      int? count, 
      Links? links,}){
    _id = id;
    _name = name;
    _slug = slug;
    _parent = parent;
    _description = description;
    _display = display;
    _image = image;
    _menuOrder = menuOrder;
    _count = count;
    _links = links;
}

  AllCategoryList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _parent = json['parent'];
    _description = json['description'];
    _display = json['display'];
    _image = json['image'];
    _menuOrder = json['menu_order'];
    _count = json['count'];
    _links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? _id;
  String? _name;
  String? _slug;
  int? _parent;
  String? _description;
  String? _display;
  String? _image;
  int? _menuOrder;
  int? _count;
  Links? _links;
AllCategoryList copyWith({  int? id,
  String? name,
  String? slug,
  int? parent,
  String? description,
  String? display,
  String? image,
  int? menuOrder,
  int? count,
  Links? links,
}) => AllCategoryList(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  parent: parent ?? _parent,
  description: description ?? _description,
  display: display ?? _display,
  image: image ?? _image,
  menuOrder: menuOrder ?? _menuOrder,
  count: count ?? _count,
  links: links ?? _links,
);
  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  int? get parent => _parent;
  String? get description => _description;
  String? get display => _display;
  String? get image => _image;
  int? get menuOrder => _menuOrder;
  int? get count => _count;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['parent'] = _parent;
    map['description'] = _description;
    map['display'] = _display;
    map['image'] = _image;
    map['menu_order'] = _menuOrder;
    map['count'] = _count;
    if (_links != null) {
      map['_links'] = _links?.toJson();
    }
    return map;
  }

}

/// self : [{"href":"https://santee.phaico.com/wp-json/wc/v3/products/categories/34"}]
/// collection : [{"href":"https://santee.phaico.com/wp-json/wc/v3/products/categories"}]

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

/// href : "https://santee.phaico.com/wp-json/wc/v3/products/categories"

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

/// href : "https://santee.phaico.com/wp-json/wc/v3/products/categories/34"

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