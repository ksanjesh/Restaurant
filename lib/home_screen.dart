import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_list/pages/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<String> images = [
    "https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg?w=2000",
    "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI=",
    "https://img.freepik.com/free-photo/flat-lay-batch-cooking-composition_23-2148765597.jpg?w=2000",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?cs=srgb&dl=pexels-ella-olsson-1640777.jpg&fm=jpg",
    "https://img.freepik.com/premium-photo/concept-indian-cuisine-baked-chicken-wings-legs-honey-mustard-sauce-serving-dishes-restaurant-black-plate-indian-spices-wooden-table-background-image_127425-18.jpg?w=2000",
    "https://traveljingles.com/wp-content/uploads/2022/08/food.jpeg",
    "https://www.holidify.com/images/cmsuploads/compressed/indian-1768906_1920_20180322173733.jpg",
  ];
  List<String> fastfood = [
    "https://img.freepik.com/free-photo/schezwan-noodles-szechwan-vegetable-hakka-noodles-chow-mein-is-popular-indo-chinese-recipes-served-bowl-plate-with-wooden-chopsticks_466689-74647.jpg?w=996&t=st=1665396961~exp=1665397561~hmac=7cbe082cd43fbae8aa1b71dc37fa91e35a3b6381960dec8d0c1045ac2e16975d",
    "https://img.freepik.com/premium-photo/homemade-burger-with-beef-cheese-onion-marmalade-wooden-board-fast-food-concept-american-food_90258-3917.jpg?w=2000",
    "https://hips.hearstapps.com/hmg-prod/images/gettyimages-643357994-1525800540.jpg",
    "https://hips.hearstapps.com/hmg-prod/images/gettyimages-643357994-1525800540.jpg",
    "https://s3.amazonaws.com/secretsaucefiles/photos/images/000/190/598/large/12783883_1062554137121907_1046912409_n.jpg?1511973763",
    "https://wtop.com/wp-content/uploads/2018/06/Russia_Soccer_WCup_Burger_Bungle_09269.jpg",
    "https://static.toiimg.com/thumb/55435214.cms?width=1200&height=900",
  ];
  List sanjesh =["sanjesh","tiwary"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Indian food"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.red[200],
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(index);
          });
        },
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: "Profile"),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 200.0, autoPlay: true),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
          ),
          horizontal(),
          mainCource()

        ],
      ),
    );
  }

  horizontal() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Fast food special",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("see more..."))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(fastfood.length, (index) {
              return Stack(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Card(
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(8),
                      child: Image.network(
                        fastfood[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                      left: 20,
                      child: Chip(
                        backgroundColor: Colors.black54,
                    label: Text("50% off",style: TextStyle(color: Colors.white),),
                  ))
                ],
              );
            }),
          ),
        )
      ],
    );
  }

  mainCource() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Main Cource Items ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              TextButton(onPressed: () {}, child: Text("see more..."))
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: List.generate(images.length, (index) {
            return  Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 12,left: 5,right: 5),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Card(
                          elevation: 8,
                          clipBehavior: Clip.antiAlias,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.all(8),
                          child: Image.network(
                            fastfood[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 10,
                          left: 20,
                          child: Chip(
                            backgroundColor: Colors.black54,
                            label: Text("50% off",style: TextStyle(color: Colors.white),),
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width*0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("sanjesh",style: TextStyle(fontSize: 24),),
                        Text("Rs 350")
                      ],
                    ),
                  )
                ],
              ),
            );
    })
        )
      ],
    );
  }
}
