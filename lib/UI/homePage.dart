import 'package:expensetracker/UI/addedBook.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //appbar variable
  Widget myTitle = Text(
    'CashBooks',
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  );
  var myLeading = null;
  late var sortIcon;
  bool searchVisiblity = true;
  bool sortVisibility = true;

  int sortState = 0;
  int pog = 0;
  TextEditingController addBookTxt = new TextEditingController();
  String bookName = '';



  @override
  initState()
  {
    super.initState();
    addBookTxt.addListener(() {
      setState((){
        bookName = addBookTxt.text;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: CustomScrollView(
                  slivers:[
                      SliverAppBar(
                        title: myTitle,
                        elevation: 5,
                        forceElevated: true,
                        backgroundColor: Colors.white,
                        leading: myLeading,
                        actions: [
                          Visibility(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  myLeading = IconButton(
                                    onPressed: () {
                                      setState(() {
                                        myTitle = Text(
                                          'CashBooks',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        );
                                        myLeading = null;
                                        sortVisibility = true;
                                        searchVisiblity = true;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_back),
                                    color: Colors.black,
                                  );
                                  myTitle = TextFormField(
                                    initialValue: 'search...',
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  );
                                  sortVisibility = false;
                                  searchVisiblity = false;
                                });
                              },
                              icon: Icon(Icons.search),
                              color: Colors.black,
                            ),
                            visible: searchVisiblity,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Visibility(
                            child: Builder(builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  displayBottomSheet(context);
                                },
                                icon: Icon(Icons.sort),
                                color: Colors.black,
                              );
                            }),
                            visible: sortVisibility,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: 10,(BuildContext context, int index,){
                    return index == 9?SizedBox(
                        height: 70,
                    ):Container(
                      padding:EdgeInsets.only(left: 10, right: 0,),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: CircleAvatar(backgroundColor: Color.fromRGBO(70, 70, 200, 0.2) ,child: Icon(Icons.book, color: Color.fromRGBO(0, 0, 139, 1),))),
                          Expanded(
                            flex: 10,
                            child:   Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                              children: [
                                Row(
                              mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(

                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*0.020,
                                        ),
                                        Text("BannaJi", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*0.013,
                                        ),
                                        Text("Created 5 minutes ago", style: TextStyle(color: Colors.grey[700]),textAlign: TextAlign.left),
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Text("2000", style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),),
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height*0.0258,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            PopupMenuButton(itemBuilder: (context)=>[
                                              PopupMenuItem(child: Row(
                                                children: [
                                                  Icon(Icons.edit,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("Rename"),

                                                ],
                                              ), value: 0,),
                                              PopupMenuItem(child: Row(
                                                children: [
                                                  Icon(Icons.person_add_alt),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("Add Members"),
                                                ],
                                              ), value: 1,),
                                              PopupMenuItem(child: Row(
                                                children: [
                                                  Icon(Icons.delete),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("Delete book"),
                                                ],
                                              ), value: 2,),
                                            ]),
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height*0.0258,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                index !=8?Divider(
                                  endIndent: 10,
                                  thickness: 1,
                                  color: Colors.black,
                                ):SizedBox(),

                              ],
                          ),
                            ),)

                        ],
                      ),
                    );
                  }),
                ),
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    displayBottomSheetAdd(context);
                  },
                  isExtended: true,
                  label: Text("Add New Book"),
                  icon: Icon(Icons.add),
                  backgroundColor: Color.fromRGBO(0, 0, 139, 1),
                ),
              );
            }
          ),
        );
  }

  void displayBottomSheet(BuildContext context) {
    int temp = sortState;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear),
                    color: Colors.black,
                  ),
                  Text(
                    'Sort Books By',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[10],
                thickness: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: RadioListTile(
                  title: Text(
                    'Last Updated',
                    style: TextStyle(
                      fontWeight:
                          sortState == 0 ? FontWeight.bold : FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  value: 0,
                  groupValue: sortState,
                  onChanged: (value) {
                    setState(() {
                      sortState = int.parse(value.toString());
                    });
                  },
                  selected: sortState == 0 ? true : false,
                  activeColor: Color.fromRGBO(0, 0, 139, 1),
                  selectedTileColor: Color.fromRGBO(0, 0, 255, 0.2),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: RadioListTile(
                  title: Text(
                    'Name (A to Z)',
                    style: TextStyle(
                        fontWeight: sortState == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Colors.black),
                  ),
                  value: 1,
                  groupValue: sortState,
                  onChanged: (value) {
                    setState(() {
                      sortState = int.parse(value.toString());
                    });
                  },
                  selected: sortState == 1 ? true : false,
                  activeColor: Color.fromRGBO(0, 0, 139, 1),
                  selectedTileColor: Color.fromRGBO(0, 0, 255, 0.2),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: RadioListTile(
                  title: Text(
                    'Net Balance (High to Low)',
                    style: TextStyle(
                        fontWeight: sortState == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Colors.black),
                  ),
                  value: 2,
                  groupValue: sortState,
                  onChanged: (value) {
                    setState(() {
                      sortState = int.parse(value.toString());
                    });
                  },
                  selected: sortState == 2 ? true : false,
                  activeColor: Color.fromRGBO(0, 0, 139, 1),
                  selectedTileColor: Color.fromRGBO(0, 0, 255, 0.2),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: RadioListTile(
                  title: Text(
                    'Net Balance (Low to High)',
                    style: TextStyle(
                        fontWeight: sortState == 3
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Colors.black),
                  ),
                  value: 3,
                  groupValue: sortState,
                  onChanged: (value) {
                    setState(() {
                      sortState = int.parse(value.toString());
                    });
                  },
                  activeColor: Color.fromRGBO(0, 0, 139, 1),
                  selectedTileColor: Color.fromRGBO(0, 0, 255, 0.2),
                  selected: sortState == 3 ? true : false,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: RadioListTile(
                  title: Text(
                    'Last Created',
                    style: TextStyle(
                        fontWeight: sortState == 4
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Colors.black),
                  ),
                  value: 4,
                  groupValue: sortState,
                  onChanged: (value) {
                    setState(() {
                      sortState = int.parse(value.toString());
                    });
                  },
                  selected: sortState == 4 ? true : false,
                  activeColor: Color.fromRGBO(0, 0, 139, 1),
                  selectedTileColor: Color.fromRGBO(0, 0, 255, 0.2),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                  onPressed: temp == sortState
                      ? null
                      : () {
                          // sorting method with setState
                          Navigator.pop(context);
                        },
                  child: Text('Apply'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 0, 139, 1)),
                ),
              ),
            ],
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white);
  }

  void displayBottomSheetAdd(BuildContext context) {
    addBookTxt.text = '';
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.clear),
                  color: Colors.black,
                ),
                Text(
                  'ADD NEW BOOK',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[10],
              thickness: 1.0,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
              ),
              child: TextField(
                controller: addBookTxt,
                autofocus: true,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: Color.fromRGBO(0, 0, 139, 1)),
                  labelText: "Enter Book Name",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 139, 1), width: 2),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey,),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        pog = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                          left: 5,
                        )),
                        Icon(
                          Icons.book,
                          color: pog == 1
                              ? Colors.grey.shade700
                              : Color.fromRGBO(0, 0, 139, 1),
                        ),
                        Text(
                          "  Private Book",
                          style: TextStyle(
                              color: pog == 1
                                  ? Colors.grey.shade700
                                  : Color.fromRGBO(0, 0, 139, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                          right: 5,
                        )),
                      ],
                    ),
                    style: ButtonStyle(
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: pog == 1
                                ? Colors.grey
                                : Color.fromRGBO(0, 0, 139, 1),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        pog == 1
                            ? Colors.grey.shade300
                            : Color.fromRGBO(0, 0, 255, 0.2),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        pog = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                          left: 5,
                        )),
                        Icon(
                          Icons.people,
                          color: pog == 1
                              ? Color.fromRGBO(0, 0, 139, 1)
                              : Colors.grey.shade700,
                        ),
                        Text(
                          "  Public Book",
                          style: TextStyle(
                              color: pog == 1
                                  ? Color.fromRGBO(0, 0, 139, 1)
                                  : Colors.grey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                          right: 5,
                        )),
                      ],
                    ),
                    style: ButtonStyle(
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: pog == 1
                                ? Color.fromRGBO(0, 0, 139, 1)
                                : Colors.grey,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        pog == 1
                            ? Color.fromRGBO(0, 0, 255, 0.2)
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pog == 0
                ? Padding(
                    padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                            "Note - Only you will have access to private book"),
                        Divider(

                          color: Colors.grey[10],
                          thickness: 1.0,
                        ),
                      ],
                    ))
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                        child: Text(
                            "Note - You can add your staff, family or business partner and create group book"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        height: 25,
                        color: Colors.grey.shade300,
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 6),
                              child: Text(
                                "Next Step :",
                                style: TextStyle(color: Colors.grey.shade800),
                              ),
                            ),
                            Text(
                              " Add member",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  Container(
                    padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: bookName == ''? null:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>addedBook()));
                      },
                      child:pog ==0?Text('Save'):Text("Save & Next"),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 0, 139, 1)),
                    ),
                  ),
              ],
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white);
  }


}
