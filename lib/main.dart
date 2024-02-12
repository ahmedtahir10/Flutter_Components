import 'package:flutter/material.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:video_player/video_player.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String result = '';
  String barcode = '';

  int _selectedIndex = 0;

  final List<String> bannersUrls = [
    'https://th.bing.com/th/id/OIP.zfcaSylFfFxG2vNJ72XpKgHaFj?w=334&h=175&c=7&o=5&dpr=2&pid=1.7',
    'https://th.bing.com/th/id/OIP.zfcaSylFfFxG2vNJ72XpKgHaFj?w=334&h=175&c=7&o=5&dpr=2&pid=1.7',
    'https://th.bing.com/th/id/OIP.zfcaSylFfFxG2vNJ72XpKgHaFj?w=334&h=175&c=7&o=5&dpr=2&pid=1.7',
  ];

  String _selectedTime = "Not set";

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Tab'),
    Text('Profile Tab'),
    Text('Settings Tab'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://prod-bwt.s3.us-east-2.amazonaws.com/public/featured/video/Naat%20e%20Rasool.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SearchAnchor(
      //         builder: (BuildContext context, SearchController controller) {
      //           return Container(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //             child: TextField(
      //               onTap: () {
      //                 controller.openView();
      //               },
      //               onChanged: (_) {
      //                 controller.openView();
      //               },
      //               decoration: InputDecoration(
      //                 hintText: "Search...",
      //                 prefixIcon: const Icon(Icons.search),
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(8.0),
      //                   borderSide: BorderSide.none,
      //                 ),
      //                 filled: true,
      //                 fillColor: Colors.grey[100],
      //                 suffixIcon: IconButton(
      //                   icon: const Icon(Icons.barcode_reader),
      //                   onPressed: () async {
      //                     await Navigator.of(context).push(
      //                       MaterialPageRoute(
      //                         builder: (context) => AiBarcodeScanner(
      //                           validator: (value) {
      //                             return value.startsWith('https://');
      //                           },
      //                           canPop: false,
      //                           onScan: (String value) {
      //                             debugPrint(value);
      //                             setState(() {
      //                               barcode = value;
      //                             });
      //                           },
      //                           onDetect: (p0) {},
      //                           onDispose: () {
      //                             debugPrint("Barcode scanner disposed!");
      //                           },
      //                           controller: MobileScannerController(
      //                             detectionSpeed: DetectionSpeed.noDuplicates,
      //                           ),
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //         suggestionsBuilder: (BuildContext context, SearchController controller) {
      //           return List<ListTile>.generate(2, (int index) {
      //             final String item = 'item $index';
      //             return ListTile(
      //               title: Text(item),
      //               onTap: () {
      //                 // Assuming setState is defined in your stateful widget
      //                 setState(() {
      //                   controller.closeView(item);
      //                 });
      //               },
      //             );
      //           });
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      // Coupon List
      // body:ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       child: ListTile(
      //         leading: Icon(Icons.local_offer),
      //         title: Text('Coupon $index'),
      //         subtitle: Text('Click to clip this coupon'),
      //         trailing: IconButton(
      //           icon: Icon(Icons.check_circle_outline),
      //           onPressed: () {
      //             // Clip coupon logic here
      //           },
      //         ),
      //       ),
      //     );
      //   },
      // ),

      // Sponsored Tiles
      //   body: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // itemCount: 4, // Number of sponsored products
      // itemBuilder: (BuildContext context, int index) {
      //   return Card(
      //     color: Colors.yellow[100],
      //     // A color to differentiate sponsored products
      //     child: Center(
      //       child: Text('Sponsored Product ${index + 1}'),
      //     ),
      //   );
      // }
      // ),

      //  Recipes

      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   itemCount: 10, // Number of recipes
      //   itemBuilder: (BuildContext context, int index) {
      //     return Card(
      //       child: Center(
      //         child: Text('Recipe ${index + 1}'),
      //       ),
      //     );
      //   },
      // ),

      // Banner

      // body: Container(
      //   height: 200,
      //   // padding: const EdgeInsets.all(10.0),
      //   child : ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: bannersUrls.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Card(
      //       child: Image.network(bannersUrls[index]));
      //   },
      // ),
      // ),

      // Image + Text

      //   body:  Stack(
      //   alignment: Alignment.center,
      //   children: <Widget>[
      //     Image.network(bannersUrls[0]),
      //     Positioned(
      //       bottom: 10,
      //       child: Text(
      //         'Your Text Here',
      //         style: TextStyle(
      //           backgroundColor: Colors.black54,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      // Video
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
