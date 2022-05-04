class Lesson {
  String id, name, lecturer, time;
  int audience;

  Lesson({this.id, this.name, this.audience, this.lecturer, this.time});

  Lesson.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    lecturer = data['lecturer'];
    time = data['time'];
    audience = data['audience'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lecturer': lecturer,
      'time': time,
      'audience': audience,
    };
  }
}
