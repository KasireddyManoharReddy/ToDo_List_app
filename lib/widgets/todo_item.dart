import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
class ToDoItem extends StatelessWidget {
  final toDo todo;
  final onToDochanged;
  final onDeleteitem;
  const ToDoItem({Key? key, required this.todo,required this.onToDochanged,required this.onDeleteitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: ListTile(
          onTap: (){
            onToDochanged(todo);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          leading: Icon( todo.isdone?Icons.check_box : Icons.check_box_outline_blank
            ,color: Colors.blueAccent,),
          title: Text( todo.text!,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,
              decoration: todo.isdone? TextDecoration.lineThrough : null,),
          ),
          trailing: IconButton(onPressed: (){
            onDeleteitem(todo.id);
          }, icon: Icon(Icons.delete,color: Colors.redAccent,))
      ),
    );
  }
}
