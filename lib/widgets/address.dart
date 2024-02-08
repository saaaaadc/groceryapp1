import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  List<Widget> datas=[];

  int  index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Addresses"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              alert(context);
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.black, // Set the background color to black
              child: Text(
                "Add Address",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: datas[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void delete(int index){
    setState(() {
      datas.removeAt(index);
    });
  }
//update cheyan ulla alert box
  void edit(name,data){
    TextEditingController saads =TextEditingController();
    TextEditingController sahis =TextEditingController();
    saads.text = name;
    sahis.text=data;
    showDialog(context: context, builder:(Context)=>AlertDialog(
        actions: [
          TextButton(onPressed: (){
            setState(() {
              datas[index]=update(index, saads.text, sahis.text);
              Navigator.pop(context);

            });
          }, child: Text("Add")),
          TextButton(onPressed: (){Navigator.of(context).pop();}, child:Text('Close'),),

        ],
        title: Text('Add Address'),
        content:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:saads,
                decoration:InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30),
                      borderSide:BorderSide(color:Colors.blue),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30),
                      borderSide:BorderSide(color:Colors.blue),

                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sahis,
                decoration:InputDecoration(
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                    borderSide:BorderSide(color:Colors.red),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                    borderSide:BorderSide(color:Colors.red),
                  ),
                ),
              ),

            )
          ],
        )
    ));

  }
//upadate container
  update(indexs,namess,datass){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text(namess,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
            Text(datass,style:TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  delete(index);
                },
                    icon:Icon(Icons.delete)),
                IconButton(onPressed: (){
                  edit(namess,datass);
                }, icon:Icon(Icons.edit)),

              ],
            ),
          ],
        ),
      ),
    );
  }
//first alert
  void alert(BuildContext context){
    TextEditingController saad =TextEditingController();
    TextEditingController sahi =TextEditingController();
    showDialog(context: context, builder:(Context)=>AlertDialog(
        actions: [
          TextButton(onPressed: (){
            setState(() {
              Navigator.pop(context);
              addcontainer(context, sahi.text, saad.text);
            });
          }, child: Text("Add")),
          TextButton(onPressed: (){Navigator.of(context).pop();}, child:Text('Close'),),
        ],
        title: Text('Add Address'),
        content:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:saad,
                decoration:InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30),
                      borderSide:BorderSide(color:Colors.blue),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30),
                      borderSide:BorderSide(color:Colors.blue),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sahi,
                decoration:InputDecoration(
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                    borderSide:BorderSide(color:Colors.red),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                    borderSide:BorderSide(color:Colors.red),
                  ),
                ),
              ),

            )
          ],
        )
    ));
  }

//first container
  addcontainer(BuildContext context,namess,datass) {
    datas.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text(namess,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                Text(datass,style:TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
                Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      delete(index);
                    },
                        icon:Icon(Icons.delete)),
                    IconButton(onPressed: (){
                      edit(namess,datass);
                    }, icon:Icon(Icons.edit)),

                  ],
                ),
              ],
            ),
          ),
        )
    );
    print(datas);
  }
}
