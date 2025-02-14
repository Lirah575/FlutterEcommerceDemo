import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:gradproject/Components/products.dart';
import 'package:gradproject/pages/cart.dart';

//my own imports
import 'package:gradproject/Components/horizontal_listview.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/m2.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        indicatorBgPadding: 8.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Text('Garavoli'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new Cart()));

              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // This is the header part
            new UserAccountsDrawerHeader(
                accountName: Text('UserName'),
                accountEmail: Text('Example@hotmail.com')),
            // Body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,  color: Colors.orange,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,  color: Colors.orange,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket,  color: Colors.orange,),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.orange,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites', ),
                leading: Icon(Icons.favorite,  color: Colors.red,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.black),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About us'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: [
          image_carousel, //padding widget
          new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Text('Categories'),
          ),

          // Horizontal List view begins here
          HorizontalList(),

          new Padding(
            padding: const EdgeInsets.all(25.0),
            child: new Text('Recent products'),
          ),

          // grid view
          Container(
            height: 320.0,
            child: Products(

            ),
          )
        ],
      ),
    );
  }
}
