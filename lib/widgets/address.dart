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
        backgroundColor: Colors.green[900],
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
              color: Colors.black54, // Set the background color to black
              child: Center(
                child: Text(
                  "Add Address",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
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
          MaterialButton(onPressed: (){
            setState(() {
              datas[index]=update(index, saads.text, sahis.text);
              Navigator.pop(context);

            });
          },
              color: Colors.green[900],
              child: Text("Add")),
          MaterialButton(onPressed: (){Navigator.of(context).pop();},
            color: Colors.green[900],
            child:Text('Close'),),

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
                      borderRadius:BorderRadius.circular(10),
                      borderSide:BorderSide(color:Colors.black),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10),
                      borderSide:BorderSide(color:Colors.black),

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
                    borderRadius:BorderRadius.circular(10),
                    borderSide:BorderSide(color:Colors.black),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide:BorderSide(color:Colors.black),
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
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.white54,
            width: MediaQuery.of(context).size.width,
            child: Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text(namess,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                Text(datass,style:TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(onPressed: (){
                edit(namess,datass);
              },
                color: Colors.green[900],
                child: Text("Edit"),),
              MaterialButton(onPressed: (){
                delete(index);
              },
                color: Colors.green[900],
                child: Text("Remove"),)
            ],
          )
        ],
      ),

    );

  }
//first alert
  void alert(BuildContext context){
    TextEditingController saad =TextEditingController();
    TextEditingController sahi =TextEditingController();
    showDialog(context: context, builder:(Context)=>AlertDialog(
        actions: [
          MaterialButton(onPressed: (){
            setState(() {
              Navigator.pop(context);
              addcontainer(context, sahi.text, saad.text);
            });
          },
              color: Colors.green[900],
              child: Text("Add")),
          MaterialButton(onPressed: (){Navigator.of(context).pop();},
            color: Colors.green[900],
            child:Text('Close'),),
        ],
        title: Text('Add Address'),
        content:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:saad,
                decoration:InputDecoration(
                    label: Text("Pincode"),
                    enabledBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10),
                      borderSide:BorderSide(color:Colors.black),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10),
                      borderSide:BorderSide(color:Colors.black),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sahi,
                decoration:InputDecoration(
                  label: Text("Address"),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide:BorderSide(color:Colors.black),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide:BorderSide(color:Colors.black),
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
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.white54,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(namess,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                    Text(datass,style:TextStyle(fontSize:15,fontWeight: FontWeight.bold)),


                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(onPressed: (){
                    edit(namess,datass);
                  },
                    color: Colors.green[900],
                    child: Text("Edit"),),
                  MaterialButton(onPressed: (){
                    delete(index);
                  },
                    color: Colors.green[900],
                    child: Text("Remove"),)
                ],
              )
            ],
          ),
        )
    );
    print(datas);
  }
}
