/// data : [{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":294,"lisense":"","lisenseLink":"","name":"完整项目","order":145000,"parentChapterId":293,"userControlSetTop":false,"visible":0},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":402,"lisense":"","lisenseLink":"","name":"跨平台应用","order":145001,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":367,"lisense":"","lisenseLink":"","name":"资源聚合类","order":145002,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":323,"lisense":"","lisenseLink":"","name":"动画","order":145003,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":314,"lisense":"","lisenseLink":"","name":"RV列表动效","order":145004,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":358,"lisense":"","lisenseLink":"","name":"项目基础功能","order":145005,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":328,"lisense":"","lisenseLink":"","name":"网络&amp;文件下载","order":145011,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":331,"lisense":"","lisenseLink":"","name":"TextView","order":145013,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":336,"lisense":"","lisenseLink":"","name":"键盘","order":145015,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":337,"lisense":"","lisenseLink":"","name":"快应用","order":145016,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":338,"lisense":"","lisenseLink":"","name":"日历&amp;时钟","order":145017,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":339,"lisense":"","lisenseLink":"","name":"K线图","order":145018,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":340,"lisense":"","lisenseLink":"","name":"硬件相关","order":145019,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":357,"lisense":"","lisenseLink":"","name":"表格类","order":145022,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":363,"lisense":"","lisenseLink":"","name":"创意汇","order":145024,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":380,"lisense":"","lisenseLink":"","name":"ImageView","order":145029,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":382,"lisense":"","lisenseLink":"","name":"音视频&amp;相机","order":145030,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":383,"lisense":"","lisenseLink":"","name":"相机","order":145031,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":310,"lisense":"","lisenseLink":"","name":"下拉刷新","order":145032,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":385,"lisense":"","lisenseLink":"","name":"架构","order":145033,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":387,"lisense":"","lisenseLink":"","name":"对话框","order":145035,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":388,"lisense":"","lisenseLink":"","name":"数据库","order":145036,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":391,"lisense":"","lisenseLink":"","name":"AS插件","order":145037,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":400,"lisense":"","lisenseLink":"","name":"ViewPager","order":145039,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":401,"lisense":"","lisenseLink":"","name":"二维码","order":145040,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":312,"lisense":"","lisenseLink":"","name":"富文本编辑器","order":145041,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":526,"lisense":"","lisenseLink":"","name":"IM","order":145042,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"author":"","children":[],"courseId":13,"cover":"","desc":"","id":539,"lisense":"","lisenseLink":"","name":"未分类","order":145043,"parentChapterId":293,"userControlSetTop":false,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class ProjectTreeBean {
  ProjectTreeBean({
      List<ProjectClassifyData> data,
      int errorCode, 
      String errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  ProjectTreeBean.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(ProjectClassifyData.fromJson(v));
      });
    }
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }
  List<ProjectClassifyData> _data;
  int _errorCode;
  String _errorMsg;
ProjectTreeBean copyWith({  List<ProjectClassifyData> data,
  int errorCode,
  String errorMsg,
}) => ProjectTreeBean(  data: data ?? _data,
  errorCode: errorCode ?? _errorCode,
  errorMsg: errorMsg ?? _errorMsg,
);
  List<ProjectClassifyData> get data => _data;
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
/// id : 294
/// lisense : ""
/// lisenseLink : ""
/// name : "完整项目"
/// order : 145000
/// parentChapterId : 293
/// userControlSetTop : false
/// visible : 0

class ProjectClassifyData {
  ProjectClassifyData({
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
      int visible,}){
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

  ProjectClassifyData.fromJson(dynamic json) {
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
ProjectClassifyData copyWith({  String author,
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
}) => ProjectClassifyData(  author: author ?? _author,
  courseId: courseId ?? _courseId,
  cover: cover ?? _cover,
  desc: desc ?? _desc,
  id: id ?? _id,
  lisense: lisense ?? _lisense,
  lisenseLink: lisenseLink ?? _lisenseLink,
  name: name ?? _name,
  order: order ?? _order,
  parentChapterId: parentChapterId ?? _parentChapterId,
  userControlSetTop: userControlSetTop ?? _userControlSetTop,
  visible: visible ?? _visible,
);
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