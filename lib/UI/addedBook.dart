import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class addedBook extends StatefulWidget {
  const addedBook({Key? key}) : super(key: key);

  @override
  State<addedBook> createState() => _addedBookState();
}

class _addedBookState extends State<addedBook> with SingleTickerProviderStateMixin {

  TextEditingController deleteBooktxt = TextEditingController();
  String deleteBookname = '';
  late AnimationController aniController;
  late Animation<Offset> animOffset;
  int child = 10;
  @override
  initState()
  {
    super.initState();
    aniController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animOffset = Tween<Offset>(
      begin: Offset(0.0,0.0),
      end: Offset(0.0,1.0),
    ).animate(aniController);
    aniController.repeat(reverse: true);
    deleteBooktxt.addListener(() {
      deleteBookname = deleteBooktxt.text;
    });
  }
  int exist = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {

          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey,
              bottomNavigationBar: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(10,5,10,10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    exist==0?Text("Add your first entry", style: TextStyle(fontWeight: FontWeight.w500),textScaleFactor: 1.7,):SizedBox(),
                    exist==0?SizedBox(height: 5,):SizedBox(),
                    exist==0?Stack(
                      children: [
                        SlideTransition(position: animOffset,child: Icon(Icons.arrow_downward_outlined, size: 30, color: Color.fromRGBO(0, 0, 139, 1),)),
                      ],
                    ):SizedBox(),
                    exist==0?SizedBox(height: 15,):SizedBox(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: exist==0?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Row(
                           children: [
                             Text("Record ", textScaleFactor: 1.2,),
                             Text("Income", textScaleFactor: 1.2, style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                         Row(
                           children: [
                             Text("Record ",textScaleFactor: 1.2, ),
                             Text("Expense", textScaleFactor: 1.2,style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),),
                           ],
                         ),
                        ],
                      ):SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(onPressed: (){
                            setState((){
                              aniController.stop();
                            });
                          }, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              Text("  CASH IN"),
                            ],

                          ), style: ElevatedButton.styleFrom(
                            minimumSize: Size(10, MediaQuery.of(context).size.height*0.06),

                            primary: Colors.green[900],
                          ),),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.05,
                        ),
                        Expanded(child: ElevatedButton(onPressed: (){}, child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.horizontal_rule),
                            Text("  CASH OUT"),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(10, MediaQuery.of(context).size.height*0.06),
                            primary: Colors.red[900],),
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              body: CustomScrollView(
                slivers:[
                  SliverAppBar(
                    forceElevated: true,
                    titleSpacing: 0,
                    backgroundColor: Colors.white,
                    leading: Icon(Icons.arrow_back, color: Colors.black,),
                    title: Text("Book Name", style: TextStyle(color: Colors.black),),
                    actions: [
                      Icon(Icons.person_add_alt, color: Color.fromRGBO(0, 0, 139, 1),),

                      PopupMenuButton(
                        onSelected: (value){
                          switch(value)
                          {
                            case 0: {
                              
                            }
                              break;
                            case 1: {
                              deleteAll(context);
                            }
                              break;
                          }

                        },
                      icon: Icon(Icons.more_vert, color: Colors.black,),
                      itemBuilder: (context)=>[

                        PopupMenuItem(child: Row(
                          children: [
                            Icon(Icons.access_time_outlined, color: Colors.grey[700],),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Book activity"),
                          ],
                        ), value: 0,),
                        PopupMenuItem(child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.grey[700],),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(width: 5,),
                            Text("Delete all entries", style: TextStyle(),),

                          ],
                        ), value: 1,),

                      ]),
                    ],

                  ),
                  exist==1?SliverPersistentHeader(delegate: mySearchBar(), pinned: true,):SliverPadding(padding: EdgeInsets.all(0)),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        exist==1?Row(
                          mainAxisSize: MainAxisSize.min,
                         children: [
                           Expanded(
                             flex: 2,
                             child: Container(
                               decoration : BoxDecoration(
                                 color: Colors.white,
                                 border: Border.all(
                                   color: Colors.grey.shade300,
                                 ),
                                 borderRadius: BorderRadius.circular(
                                   3,
                                 ),
                               ),
                               margin: EdgeInsets.only(left: 20),
                               padding: EdgeInsets.only(
                                   top: 13,
                                   left: 13,
                                   right: 13,
                                   bottom: 13),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Expanded(flex:1,child: Icon(Icons.calendar_month, color: Color.fromRGBO(0, 0, 139, 1), size: 20,)),
                                   Expanded(flex:4, child: Text("All Time",textScaleFactor: 1.0, style: TextStyle(fontWeight: FontWeight.w500),),
                                   )
                                 ],
                               ),

                             ),
                           ),
                         Expanded(flex:1, child:Container(
                           decoration : BoxDecoration(
                             color: Colors.white,
                             border: Border.all(
                               color: Colors.grey.shade300,
                             ),
                             borderRadius: BorderRadius.circular(
                               3,
                             ),
                           ),
                           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                           padding: EdgeInsets.only(
                               top: 13,
                               left: 13,
                               right: 13,
                               bottom: 13),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Icon(Icons.filter_alt_outlined, color: Color.fromRGBO(0, 0, 139, 1), size: 20,),
                               Text("Filters",textScaleFactor: 1.0, style: TextStyle(fontWeight: FontWeight.w500),),
                             ],
                           ),

                         ),),
                         ],
                        ):SizedBox(),
                        Container (
                          decoration : BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(
                              3,
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(20,exist==1?0:15,20,15),
                          padding: EdgeInsets.only(
                            top: 13,
                            left: 13,
                          right: 13,
                          bottom: 13),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Net Balance", textScaleFactor: 1.3, style: TextStyle(letterSpacing: 0.6,fontWeight: FontWeight.bold),),
                                  Text("0",textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),

                              Row(
                                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total In(+)", textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green.shade900),),
                                  Text("0",textScaleFactor: 1.1, style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Out(+)",textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[900]),),
                                  Text("0", textScaleFactor: 1.1,style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),
                              Text("VIEW REPORT  >", textScaleFactor: 1.2, style: TextStyle(color: Color.fromRGBO(0, 0, 139, 1), letterSpacing: 1, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                            ],
                          ),

                        ),
                        exist==1?Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Expanded(child: Divider(
                                thickness: 1,
                                endIndent: 10,
                                indent: 20,
                                color: Colors.grey[300],
                              )),
                              Text("Showing 8 entries ", style: TextStyle(color: Colors.grey[700],letterSpacing: 0.5, fontWeight: FontWeight.w500),),
                              Expanded(child: Divider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 20,
                                color: Colors.grey[300],
                              ))
                            ],
                          ),
                        ):SizedBox(),

                      ],
                    ),),
                  SliverList(delegate: SliverChildBuilderDelegate(childCount: child+1,(BuildContext context, int index){
                    print(index);
                    return index==child?Center(
                      child: Container(
                        margin: EdgeInsets.only(top:10, bottom: 10 ),
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.lock, color: Colors.green[900],),
                            Text(" Only you can see these entries"),
                          ],
                        ),

                      ),
                    ):Container(
                      padding: EdgeInsets.only(
                        right: 10,
                        left: 10,
                        top:10,
                        bottom : 10,
                      ),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remarks", style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration : BoxDecoration(
                                            color:Color.fromRGBO(143,0,255,0.2),
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Text("Category", style:TextStyle(color:Color.fromRGBO(143, 0, 255, 1), fontWeight: FontWeight.w500, letterSpacing: 0.5)),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        decoration : BoxDecoration(
                                            color:Color.fromRGBO(100,100,255,0.2),
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Text("mode", style:TextStyle(color:Color.fromRGBO(0, 0, 139, 1), fontWeight: FontWeight.w500, letterSpacing: 0.5)),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),

                                  Row(
                                    children: [
                                      Icon(Icons.attachment_sharp),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Image", textScaleFactor: 1.2, style: TextStyle(decoration: TextDecoration.underline),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),

                                  Text("10:02 am", style:TextStyle(
                                    color: Colors.grey[500],
                                  )),

                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:[
                                  Text("200", style: TextStyle(
                                      color: Colors.red[900],
                                      fontWeight: FontWeight.w500
                                  ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),
                                  Text("Balance : 2000", ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.09,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(thickness: 1,
                            color: Colors.grey[300],),
                        ],
                      ),
                    );
                  },)),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  void deleteAll(BuildContext context) {
    deleteBooktxt.text = '';
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Delete all entries of Book Name?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      textScaleFactor: 1.1,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[10],
                  thickness: 1.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right:10, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                  ),
                  padding: EdgeInsets.only(left: 10, top:15, bottom:15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 15,
                        child: Text("!", textScaleFactor: 1, style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(
width: MediaQuery.of(context).size.width*0.03,
                      ),
                      Expanded(child: Text("Are you sure? You will lose all entries of this book permanently"))
                    ],
                  ),
                ),
                Text("    Please type Book Name to confirm"),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
                  child: TextField(
                    controller: deleteBooktxt,
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
                Container(
                  padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    onPressed: deleteBookname == ''? null:(){
                        print("book has been deleted");
                    },
                    child:Text("DELETE"),
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

class mySearchBar extends SliverPersistentHeaderDelegate
{
  @override
  Widget build(BuildContext con, double shrink, bool overlaps)
  {
    return 1==1?Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(flex: 1,child: Icon(Icons.search, color: Colors.grey[700],)),
          Expanded(
            flex: 7,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search by Remark",
              ),
            ),
          ),
        ],
      ),
    ):SizedBox();
  }
  @override
  // TODO: implement maxExtent
  double get maxExtent => 48.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 48.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class myDate extends SliverPersistentHeaderDelegate
{
  String date;
  myDate(this.date);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(
          left: 15,

          bottom: 10
      ),
      child: Text(date, style: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
      ),),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 48.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 48.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}
