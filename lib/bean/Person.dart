

class PerSon {
  String name;
  int age;

  PerSon(this.name, this.age);

  say(String name) {
    print("are you ok $name");
  }
}

main(){
  var toly = new PerSon("toly", 24);
  toly.say("ls");//are you ok ls
}



//继承
class Student extends PerSon {
  String school;
  Student(String name, int age, this.school) : super(name, age);
}

main2() {
  new Student("ls", 23, "星龙学院").say("toly");//are you ok toly
}
