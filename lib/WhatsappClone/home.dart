import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/WhatsappClone/chat.dart';

class WhatsappPage extends StatefulWidget {
  @override
  _WhatsappPageState createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage> {
  List<Peoples> peoples = [
    Peoples(
        image: 'assets/Whatsapp/camera.png',
        name: '',
        onPressed: () => print('Camera')),
    Peoples(
        image: 'assets/Whatsapp/1.jpg',
        name: 'Cristian',
        onPressed: () => print('Cristian')),
    Peoples(
        image: 'assets/Whatsapp/2.jpg',
        name: 'Laura',
        onPressed: () => print('Laura')),
    Peoples(
        image: 'assets/Whatsapp/3.jpg',
        name: 'Paula',
        onPressed: () => print('Paula')),
    Peoples(
        image: 'assets/Whatsapp/4.jpg',
        name: 'Alejandra',
        onPressed: () => print('Alejandra')),
    Peoples(
        image: 'assets/Whatsapp/5.jpg',
        name: 'Brayan',
        onPressed: () => print('Brayan')),
    Peoples(
        image: 'assets/Whatsapp/6.jpg',
        name: 'Camilo',
        onPressed: () => print('Camilo')),
    Peoples(
        image: 'assets/Whatsapp/7.jpg',
        name: 'Yesenia',
        onPressed: () => print('Yesenia')),
    Peoples(
        image: 'assets/Whatsapp/8.jpg',
        name: 'Wilmer',
        onPressed: () => print('Wilmer')),
    Peoples(
        image: 'assets/Whatsapp/9.jpg',
        name: 'Owen',
        onPressed: () => print('Owen')),
    Peoples(
        image: 'assets/Whatsapp/10.jpg',
        name: 'Andres',
        onPressed: () => print('Andres')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Header(
              person: peoples,
            ),
            Body(
              person: peoples,
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 960.0;
  }

  bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

  const Header({Key key, @required this.person}) : super(key: key);
  final List person;
  @override
  Widget build(BuildContext context) {
    if (isLargeScreen(context)) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: double.infinity,
              color: Colors.teal,
              child: Column(
                children: [
                  Container(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Whatsapp',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.search_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: kToolbarHeight + 20,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: person.length,
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: person[i].onPressed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: kToolbarHeight / 2,
                                backgroundImage: AssetImage(person[i].image),
                              ),
                              Text(
                                person[i].name,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      );
    } else if (isMediumScreen(context)) {
      return Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: double.infinity,
              color: Colors.teal,
              child: Column(
                children: [
                  Container(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Whatsapp',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.search_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: kToolbarHeight + 20,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: person.length,
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: person[i].onPressed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: kToolbarHeight / 2,
                                backgroundImage: AssetImage(person[i].image),
                              ),
                              Text(
                                person[i].name,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.white,
              ))
        ],
      );
    } else {
      return Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: double.infinity,
              color: Colors.teal,
              child: Column(
                children: [
                  Container(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Whatsapp',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.search_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: kToolbarHeight + 20,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: person.length,
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: person[i].onPressed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: kToolbarHeight / 2,
                                backgroundImage: AssetImage(person[i].image),
                              ),
                              Text(
                                person[i].name,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
    }
  }
}

class Bar {
  Icon icon;
  VoidCallback onPressed;

  Bar({
    @required this.icon,
    @required this.onPressed,
  });
}

class Peoples {
  final String image, name;
  final VoidCallback onPressed;

  Peoples({
    @required this.image,
    @required this.name,
    @required this.onPressed,
  });
}

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({
    Key key,
    this.person,
  }) : super(key: key);
  final List person;

  List<Bar> iconos = [
    Bar(
        icon: Icon(
          Icons.message_outlined,
          color: Colors.white,
        ),
        onPressed: () => print('mensaje')),
    Bar(
        icon: Icon(
          Icons.group,
          color: Colors.white,
        ),
        onPressed: () => print('group')),
    Bar(
        icon: Icon(
          Icons.call_outlined,
          color: Colors.white,
        ),
        onPressed: () => print('call')),
    Bar(
        icon: Icon(
          Icons.person_add_alt,
          color: Colors.white,
        ),
        onPressed: () => print('add')),
  ];

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 960.0;
  }

  bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

  @override
  Widget build(BuildContext context) {
    if (isLargeScreen(context)) {
      return LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: ListView.separated(
                    separatorBuilder: (_, i) => Divider(),
                    itemCount: person.length - 1,
                    itemBuilder: (_, i) => ListTile(
                      leading: CircleAvatar(
                        radius: kToolbarHeight / 2,
                        backgroundImage: AssetImage(person[i + 1].image),
                      ),
                      title: Text(person[i + 1].name),
                      subtitle: Text('Hola como estas'),
                      trailing: Column(
                        children: [
                          Text('12:00 pm'),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.check,
                            size: 20,
                          )
                        ],
                      ),
                      onTap: () {
                        print('hola');
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: constraints.maxHeight * 0.03,
                  right: constraints.maxWidth / 4,
                  left: constraints.maxWidth / 4,
                  child: Container(
                    height: kToolbarHeight,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          iconos.length,
                          (index) => IconButton(
                              icon: iconos[index].icon,
                              onPressed: iconos[index].onPressed)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    } else if (isMediumScreen(context)) {
      return LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(),
                itemCount: person.length - 1,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    radius: kToolbarHeight / 2,
                    backgroundImage: AssetImage(person[i + 1].image),
                  ),
                  title: Text(person[i + 1].name),
                  subtitle: Text('Hola como estas'),
                  trailing: Column(
                    children: [
                      Text('12:00 pm'),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.check,
                        size: 20,
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.03,
              right: constraints.maxWidth / 4,
              left: constraints.maxWidth / 4,
              child: Container(
                height: kToolbarHeight,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      iconos.length,
                      (index) => IconButton(
                          icon: iconos[index].icon,
                          onPressed: iconos[index].onPressed)),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(),
                itemCount: person.length - 1,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    radius: kToolbarHeight / 2,
                    backgroundImage: AssetImage(person[i + 1].image),
                  ),
                  title: Text(person[i + 1].name),
                  subtitle: Text('Hola como estas'),
                  trailing: Column(
                    children: [
                      Text('12:00 pm'),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.check,
                        size: 20,
                      )
                    ],
                  ),
                  onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(),)),
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.03,
              right: constraints.maxWidth / 4,
              left: constraints.maxWidth / 4,
              child: Container(
                height: kToolbarHeight,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      iconos.length,
                      (index) => IconButton(
                          icon: iconos[index].icon,
                          onPressed: iconos[index].onPressed)),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
