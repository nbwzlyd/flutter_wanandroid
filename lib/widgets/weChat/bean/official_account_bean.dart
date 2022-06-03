/// data : [{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":408,"lisense":"","lisenseLink":"","name":"鸿洋","order":190000,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":409,"lisense":"","lisenseLink":"","name":"郭霖","order":190001,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":410,"lisense":"","lisenseLink":"","name":"玉刚说","order":190002,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":411,"lisense":"","lisenseLink":"","name":"承香墨影","order":190003,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":413,"lisense":"","lisenseLink":"","name":"Android群英传","order":190004,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":414,"lisense":"","lisenseLink":"","name":"code小生","order":190005,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":415,"lisense":"","lisenseLink":"","name":"谷歌开发者","order":190006,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":416,"lisense":"","lisenseLink":"","name":"奇卓社","order":190007,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":417,"lisense":"","lisenseLink":"","name":"美团技术团队","order":190008,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":420,"lisense":"","lisenseLink":"","name":"GcsSloop","order":190009,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":421,"lisense":"","lisenseLink":"","name":"互联网侦察","order":190010,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":427,"lisense":"","lisenseLink":"","name":"susion随心","order":190011,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":428,"lisense":"","lisenseLink":"","name":"程序亦非猿","order":190012,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":434,"lisense":"","lisenseLink":"","name":"Gityuan","order":190013,"parentChapterId":407,"userControlSetTop":false,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class OfficialAccountBean {
  OfficialAccountBean({
    List<Account> data,
    int errorCode,
    String errorMsg,
  }) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  OfficialAccountBean.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Account.fromJson(v));
      });
    }
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  List<Account> _data;
  int _errorCode;
  String _errorMsg;

  OfficialAccountBean copyWith({
    List<Account> data,
    int errorCode,
    String errorMsg,
  }) =>
      OfficialAccountBean(
        data: data ?? _data,
        errorCode: errorCode ?? _errorCode,
        errorMsg: errorMsg ?? _errorMsg,
      );

  List<Account> get data => _data;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }
}

/// author : ""
/// children : []
/// courseId : 13
/// cover : ""
/// desc : ""
/// id : 408
/// lisense : ""
/// lisenseLink : ""
/// name : "鸿洋"
/// order : 190000
/// parentChapterId : 407
/// userControlSetTop : false
/// visible : 1

class Account {
  Account({
    String author,
    int courseId,
    String cover,
    String desc,
    int id,
    String lisense,
    String lisenseLink,
    String name,
    int order,
    int parentChapterId,
    bool userControlSetTop,
    int visible,
  }) {
    _author = author;
    _courseId = courseId;
    _cover = cover;
    _desc = desc;
    _id = id;
    _lisense = lisense;
    _lisenseLink = lisenseLink;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
  }

  Account.fromJson(dynamic json) {
    _author = json['author'];
    _courseId = json['courseId'];
    _cover = json['cover'];
    _desc = json['desc'];
    _id = json['id'];
    _lisense = json['lisense'];
    _lisenseLink = json['lisenseLink'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _userControlSetTop = json['userControlSetTop'];
    _visible = json['visible'];
  }

  String _author;
  int _courseId;
  String _cover;
  String _desc;
  int _id;
  String _lisense;
  String _lisenseLink;
  String _name;
  int _order;
  int _parentChapterId;
  bool _userControlSetTop;
  int _visible;
  String get author => _author;

  int get courseId => _courseId;

  String get cover => _cover;

  String get desc => _desc;

  int get id => _id;

  String get lisense => _lisense;

  String get lisenseLink => _lisenseLink;

  String get name => _name;

  int get order => _order;

  int get parentChapterId => _parentChapterId;

  bool get userControlSetTop => _userControlSetTop;

  int get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;

    map['courseId'] = _courseId;
    map['cover'] = _cover;
    map['desc'] = _desc;
    map['id'] = _id;
    map['lisense'] = _lisense;
    map['lisenseLink'] = _lisenseLink;
    map['name'] = _name;
    map['order'] = _order;
    map['parentChapterId'] = _parentChapterId;
    map['userControlSetTop'] = _userControlSetTop;
    map['visible'] = _visible;
    return map;
  }
}
