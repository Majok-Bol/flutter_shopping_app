import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
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
}