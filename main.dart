
import 'package:flutter/material.dart';

void main() {
  runApp(const toDo());
}
class toDo extends StatelessWidget {
  const toDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: toDoScreen(),
    );
  }
}

class toDoScreen extends StatefulWidget {
  const toDoScreen({Key? key}) : super(key: key);

  @override
  State<toDoScreen> createState() => _toDoScreenState();
}

class _toDoScreenState extends State<toDoScreen> {
  List<String> toDoList=[];
  TextEditingController t1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do list',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView.separated(
                  itemBuilder: (BuildContext contex, int index ){
                    return Dismissible(
                      background: Container(
                        color: Colors.purpleAccent,
                      ),
                      key: Key(toDoList[index]),
                        child: ListTile(title: Text('${toDoList[index]}',style: TextStyle(fontWeight: FontWeight.bold),),),
                    onDismissed: (direction){
                        setState(() {
                          toDoList.removeAt(index);
                        });
                    },
                    );
                  },
                  separatorBuilder: (BuildContext contex, int index)=>Divider(),
                  itemCount: toDoList.length),
            ),
          ),
          TextField(

            controller: t1,
            decoration: InputDecoration(hintText: 'write task'),

          ),
        ],
      ),
      //when you add the taxt you can tab this botton
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            toDoList.add(t1.text);
            t1.clear();
          });
        },
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),

      ),

    );
  }
}


