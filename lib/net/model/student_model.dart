class Student{
  String studentId;
  String studentName;
  int studentScores;

  Student({
    this.studentId,
    this.studentName,
    this.studentScores
  });

  //序列化 简单来讲就是把数据（可能在对象中）写成字符串，反序列化 正好相反。
  //这些类成员映射到 json 对象 我们在实现一个构造函数时使用 factory 关键字时，这个构造函数不会总是创建其类的新实例，而
  factory Student.fromJson(Map<String, dynamic> parsedJson){
    return Student(
        studentId: parsedJson['id'],
        studentName : parsedJson['name'],
        studentScores : parsedJson ['score']
    );
  }
}