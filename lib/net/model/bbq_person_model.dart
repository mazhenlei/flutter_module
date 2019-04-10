


///http://bbqzs.shandw.com/playercombat? //域名+方法名
/// uid=1837005618&playerId=BN0100018
/// &token=c827365b6c8f9255da5730ca3a5b82ea
/// &fl=10275
/// &sec=1554104007110
/// &page=0  页数
/// &channel=10275
/// &countrycode=cn
/// &pageSize=10 //数量
/// &killNum=0

class BbqPerson {
  final List<LvListBean> lvList;
  final int result;
  final List<DataBean> data;

  BbqPerson({this.lvList, this.result, this.data});

  //创建构造方法 抛出异常 Unhandled Exception: type 'String' is not a subtype of type 'Map<String, dynamic>'
  factory BbqPerson.fromJson(Map<String, dynamic> parsedJson) {

    var lv = parsedJson['lvList'] as List;
    List<LvListBean> lvBean = lv.map((i) => LvListBean.fromJson(i)).toList();

    var dataList = parsedJson['data'] as List;
    List<DataBean> dataBeanList =
        dataList.map((i) => DataBean.fromJson(i)).toList();

    return BbqPerson(
      lvList: lvBean,
      result: parsedJson['result'],
      data: dataBeanList,
    );
  }
}

class LvListBean {
  final String romaBg;
  final int totalStar;
  final int id;
  final String lvlBg;
  final String lvlName;

  LvListBean({this.romaBg, this.totalStar, this.id, this.lvlBg, this.lvlName});

  //创建构造方法
  factory LvListBean.fromJson(Map<String, dynamic> parsedJson) {
    return LvListBean(
      romaBg: parsedJson['romaBg'],
      totalStar: parsedJson['imageName'],
      id: parsedJson['id'],
      lvlBg: parsedJson['lvlBg'],
      lvlName: parsedJson['lvlName'],
    );
  }
}

class DataBean {
  final String iuin;
  final String room_id;
  final String fight_level;
  final String record_time;
  final String kill_num;//击杀
  final String death_num;//死亡
  final String ass_num;//助攻
  final String last_score;//最后得分
  final String rank;//名次
  final String hero_type_id;
  final String achieve_id;
  final String nickname;

  DataBean(
      {this.iuin,
      this.room_id,
      this.fight_level,
      this.record_time,
      this.kill_num,
      this.death_num,
      this.ass_num,
      this.last_score,
      this.rank,
      this.hero_type_id,
      this.achieve_id,
      this.nickname});

  factory DataBean.fromJson(Map<String, dynamic> parsedJson) {
    return DataBean(
      iuin: parsedJson['iuin'],
      room_id: parsedJson['room_id'],
      fight_level: parsedJson['fight_level'],
      record_time: parsedJson['record_time'],
      kill_num: parsedJson['kill_num'],
      death_num: parsedJson['death_num'],
      ass_num: parsedJson['ass_num'],
      last_score: parsedJson['last_score'],
      rank: parsedJson['rank'],
      hero_type_id: parsedJson['hero_type_id'],
      achieve_id: parsedJson['achieve_id'],
      nickname: parsedJson['nickname'],
    );
  }
}
