import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/widgets/todo_item.dart';
import 'package:todo_list/model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  final todosList =toDo.todoList();
  List<toDo> _found = [];
  final _todocontroller = TextEditingController();
  @override
  void initState(){
    _found =todosList;
    super.initState();
  }
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue[200],
          title:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu,size:30,color: Colors.black87,),
              Text('TO DO LIST',style: TextStyle(color: Colors.black87),),
              Container(
                height: 50,
                width:50,
                child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.asset('assets/images/image1.jpg',
                ),),
              )
            ],
          ),
        ),
        backgroundColor: Colors.blue[200],
        body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextField(
                        onChanged: (value)=> _runFilter(value),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),prefixIcon: Icon(Icons.search,color: Colors.black87,size: 20,),
                            prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),border:InputBorder.none,hintText: 'Search'
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(children: [
                        Container(
                          margin:EdgeInsets.only(top: 50,bottom: 30),
                          child: Text('TODOs',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.center,),
                        for(toDo todo in _found.reversed)
                          ToDoItem(todo: todo,
                            onToDochanged:_handletodochange,
                            onDeleteitem:_deletetodoitem,),


                      ],),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: TextField(
                        controller: _todocontroller,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none,
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      decoration: BoxDecoration(color: Colors.white,
                        boxShadow:[BoxShadow(color:Colors.grey,offset: Offset(0.0, 0.0),blurRadius: 10,spreadRadius: 0,),],
                        borderRadius: BorderRadius.circular(10),

                      ),
                    ),
                    ),
                    Container(margin: EdgeInsets.only(bottom: 20,right: 20,),
                      child: ElevatedButton(onPressed: (){
                        _addtodoitem(_todocontroller.text);
                      }, child: Icon(Icons.add,size: 40,),style: ElevatedButton.styleFrom(minimumSize:Size(60, 60),elevation: 10 ),),)
                  ],

                ),
              ),
            ]
        ),
      ),
    );
  }
  void _deletetodoitem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _handletodochange(toDo todo){
    setState(() {
      todo.isdone=!todo.isdone;
    });
  }
  void _addtodoitem(String ToDo){
    setState(() {
      todosList.add(toDo(id: DateTime.now().millisecondsSinceEpoch.toString(), text:ToDo,),);
    });
    _todocontroller.clear();
  }
  void _runFilter(String keyword){
    List<toDo> results = [];
    if(keyword.isEmpty)
    {
      results =todosList;
    }else
    {
      results = todosList.where((item) => item.text!.toLowerCase().contains(keyword.toLowerCase())).toList();
    }
    setState(() {
      _found = results;
    });
  }
}



