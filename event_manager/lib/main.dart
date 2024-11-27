import 'package:event_manager/home_page.dart';
import 'package:event_manager/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homepage(imagedata: "Haldi.png"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> items = List.generate(13, (index) => 'Item ${index + 1}');
  List<String> imageList=["Birthday Party.png","Cocktail Party.png","Engagement.png","Farmhouse Party.png","Get together.png","Haldi.png","House Warming.png","Kitty Party.png","Office Party.png","Pooja.png","Reception.png","Wedding.png","Workshop.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {

                        });
                      },
                      icon: const Icon(Icons.arrow_back_outlined, color: Colors.black),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Events',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height - 40,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.75
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Rounded corners

                      ),

                      child: Card(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  "assets/images/"+imageList[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.transparent,Colors.black87],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                                  ),
                                  child: Text(
                                    imageList[index].substring(0,imageList[index].length-4),
                                    style: TextStyle(
                                      fontSize:MediaQuery.of(context).size.width*0.03,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>homepage(imagedata: imageList[index],)));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
