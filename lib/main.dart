import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      home:ShoppingList(),
    );
  }
}
class ShoppingList extends StatefulWidget{
  ShoppingListState createState()=>ShoppingListState();

}
class ShoppingListState extends State<ShoppingList>{
  final List<String>itemsToAdd=[];
  final TextEditingController itemController=TextEditingController();
  void addItem(){
    setState(() {
      if(itemController.text.isNotEmpty){
        itemsToAdd.add(itemController.text);
      itemController.clear();
      }
    });

  }
  void resetItems(){
  setState(() {
    itemsToAdd.clear();
  });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Shopping list',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.grey,),
      body:Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  controller: itemController,
                  decoration: InputDecoration(
                    hintText: 'Enter item',
                    border: OutlineInputBorder(),
                  ),

                ),

                ),
                IconButton(onPressed: addItem, icon: Icon(Icons.add)),
                IconButton(onPressed: resetItems, icon: Icon(Icons.delete)),
              ],

            ),
            Expanded(child: ListView.builder(
              itemCount: itemsToAdd.length,
                itemBuilder: (context,index){
                return ListTile(title: Text(itemsToAdd[index]),);
                },),),

          ],
        ),
      ),
    );
  }
}