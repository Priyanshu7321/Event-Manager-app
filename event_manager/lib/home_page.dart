import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  final String imagedata;
  const homepage({Key? key, required this.imagedata}) : super(key: key);

  @override
  State<homepage> createState() => _HomepageState();
}

class _HomepageState extends State<homepage> with TickerProviderStateMixin {
  late TabController tabController;
  late AnimationController animaController;
  late Animation<double> _animationLeft;
  late Animation<double> _animationRight;
  int toSelect = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    animaController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Define animations for left and right movement
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;

      setState(() {
        _animationLeft = Tween<double>(begin: 0, end:-1* screenWidth / 4).animate(
          CurvedAnimation(parent: animaController, curve: Curves.linear),
        );

        _animationRight = Tween<double>(begin: 0, end: screenWidth / 4).animate(
          CurvedAnimation(parent: animaController, curve: Curves.linear),
        );
      });
    });

  }


  @override
  void dispose() {
    tabController.dispose();
    animaController.dispose();
    super.dispose();
  }
  void animateContainers(int index) {

    animaController.forward().then((_) {

      animaController.reverse();
      setState(() {
        toSelect = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body:Container(child: Stack(children:[Container(height:double.maxFinite,padding:EdgeInsets.only(left: 0),color: Colors.white,child: Column(children: [Container(height:180,child:  Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/${widget.imagedata}',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Container(
            child: Row(
            children: [
              IconButton(onPressed:(){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_outlined,size: 20,),color: Colors.white,),
              Spacer(),
              Text(widget.imagedata.substring(0,widget.imagedata.length-4),style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.055,color: Colors.white,fontWeight: FontWeight.bold),),
              Spacer(),
            ],
          ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First container animation
                Expanded(
                  child: AnimatedBuilder(
                    animation: animaController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset( _animationRight.value, 0),
                        child: child,
                      );
                    },
                    child: CustomTabButton(
                      label: "Bulk Food Delivery",
                      isSelected: toSelect == 0,
                      onTap: () => animateContainers(0),
                    ),
                  ),
                ),
                // Second container animation
                Expanded(
                  child: AnimatedBuilder(
                    animation: animaController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_animationLeft.value , 0),
                        child: child,
                      );
                    },
                    child: CustomTabButton(
                      label: "Catering Service",
                      isSelected: toSelect == 1,
                      onTap: () => animateContainers(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
        Container(height:40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 2,
              ),
            ],
          ),
          child: TabBar(

          controller: tabController,
          isScrollable: true,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.red.shade600,
          indicatorWeight: 4,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(text: "ALL (8)",height: 30,),
            Tab(text: "Breakfast"),
            Tab(text: "Lunch & Dinner"),
            Tab(text: "Snacks"),
          ],
        ),
        ),
        // TabBarView
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              buildItemList(),
              Center(child: Text("Breakfast Items")),
              Center(child: Text("Lunch & Dinner Items")),
              Container(child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.center,children: [ Image.asset("assets/images/x-mark.png",height: 50,width: 50,color: Colors.grey,),Text("No Platters Available")]),),
            ],
          ),
        ),
    ],
    ),
    ),
        Align(alignment: Alignment.bottomCenter,child: Container(
          height: 60,
          width: double.maxFinite,
          color: Colors.white,
          padding:EdgeInsets.only(left:10,right:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Stack(
                alignment:Alignment.topLeft,
                children: [
            Center(child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/image 651.png',
                fit: BoxFit.cover,
              ),
            ),
          ),),
          Center(child:Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 13),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/image 651.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Center(child:Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 23),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/image 651.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
                  Center(child: Container(child: Text("3 Platters",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),margin: EdgeInsets.only(left: 80),)
                  ),
                ],
              ),
              ),
              Card(color:Colors.purple,child: Container(width:MediaQuery.of(context).size.width*0.33,height:MediaQuery.of(context).size.height*0.1,padding:EdgeInsets.all(5),child: Row(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.center,children: [Text("View Cart  ",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.030),),Image.asset("assets/images/up-arrow.png",width: MediaQuery.of(context).size.width*0.023,height: MediaQuery.of(context).size.height*0.023,color: Colors.white,),],),),),
            ],
          ),
        )
        ),
      ],
      ),
    ),

    );
  }

  Widget buildItemList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
          color: Colors.white,
          elevation: 4,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    width: double.infinity,
                    child: Stack(
                    children: [

                      Image.asset("assets/images/image 45.png",fit: BoxFit.cover,width: double.infinity,),
                      Align(alignment: Alignment.topLeft,child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.purpleAccent,Colors.purple]),
                        ),
                        margin: EdgeInsets.only(top: 20),

                        child:  Text(
                          "  Popular ",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12),
                        ),
                      ),
                      ),
                    ],
                  ),
                  ),

                Container(padding:EdgeInsets.only(left: 5,right: 5),child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "South Breakfast",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.person,size: 14,)),
                        const Text(
                          "Min 10 - Max 120",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        const Spacer(),
                        const Text(
                          " Starts at ",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        const Text(
                          "₹299",
                          style: TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 2),
                    // Categories
                    const Text(
                      "12 Categories & 40 Items",
                      style: TextStyle(fontSize: 14, color: Colors.purple),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Container(
                            child:  Text("3 Live Counter",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                          ),
                            Container(
                              child:  Text("3 Main",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                          ],
                          ),
                          ),
                          ),

                          Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Container(
                            child:  Text("3 Live Counter",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                          ),
                            Container(
                              child:  Text("3 Main",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                          ],
                          ),
                          ),
                          ),
                          Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Container(
                            child:  Text("3 Live Counter",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                          ),
                            Container(
                              child:  Text("3 Main",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                            Container(
                              child:  Text("3 Desserts",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),),
                            ),
                          ],
                          ),
                          ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ],
            ),
        );
      },
    );
  }
}

class CustomTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomTabButton({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 2 ,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
          borderRadius:isSelected ? BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)): BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
        ),
        child: Stack(
    children: [Align(
      alignment: Alignment.center,
      child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.purple : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width * 0.03,
          ),
        ),
    ),
        ],
        ),
      ),
    );
  }

}
