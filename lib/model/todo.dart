class toDo {
  String?id;
  String? text;
  bool isdone;


  toDo({
    required this.id,
    required this.text,
    this.isdone =false,

  });
  static List<toDo> todoList(){
    return[
      toDo(id:'01',text:'Morning Exercise',isdone: true),
      toDo(id:'02',text:'Buy groceries',isdone: true),
      toDo(id:'03',text:'Check Mails',isdone: false),
      toDo(id:'04',text:'work',isdone: false),
      toDo(id:'05',text:'Dinner',isdone: true),
    ];

  }
}