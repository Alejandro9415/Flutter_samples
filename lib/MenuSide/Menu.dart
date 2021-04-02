import 'package:flutter_samples/MenuSide/page1.dart';
import 'package:flutter_samples/MenuSide/page2.dart';
import 'package:flutter_samples/MenuSide/page3.dart';
import 'package:flutter_samples/MenuSide/page4.dart';
import 'package:flutter_samples/MenuSide/page5.dart';
import 'package:flutter_samples/MenuSide/page6.dart';
import 'package:flutter_samples/MenuSide/page7.dart';
import 'package:flutter/material.dart';

class MainSideMenu extends StatefulWidget {
  @override
  _MainSideMenuState createState() => _MainSideMenuState();
}

class _MainSideMenuState extends State<MainSideMenu> {
  final _data = List<String>.generate(8, (index) {
    if (index == 0) {
      return 'assets/icn_close.png';
    }
    return 'assets/icn_$index.png';
  });

  int _selectedIndex = 1;

  Widget _getWidget() {
    Widget value;
    if (_selectedIndex == 1) {
      value = Page1();
    } else if (_selectedIndex == 2) {
      value = Page2();
    } else if (_selectedIndex == 3) {
      value = Page3();
    } else if (_selectedIndex == 4) {
      value = Page4();
    } else if (_selectedIndex == 5) {
      value = Page5();
    } else if (_selectedIndex == 6) {
      value = Page6();
    } else if (_selectedIndex == 7) {
      value = Page7();
    }
    return value;
  }

  String _getText() {
    if (_selectedIndex.isOdd) {
      return 'FILMS';
    } else {
      return 'MUSIC';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      selectedColor: Color(0xFFCE5C7F),
      unselectedColor: Color(0xFF3A3B55),
      onItemSelected: (index) {
        if (index != 0) {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      builder: (showMenu) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            // centerTitle: true,
            // title: Text(_getText(), style: TextStyle(color: Colors.black),),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: showMenu,
            ),
          ),
          body: _getWidget(),
        );
      },
      item: _data
          .map((e) => Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(color: Colors.blueGrey.shade900))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(e),
                ),
              ))
          .toList(),
    );
  }
}

typedef SideMenuBuilder = Widget Function(VoidCallback showMenu);

class SideMenu extends StatefulWidget {
  const SideMenu({
    this.builder,
    this.item,
    this.onItemSelected,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.green,
    this.width = 80.0,
    this.duration = const Duration(milliseconds: 800),
  });

  final SideMenuBuilder builder;
  final List<Widget> item;
  final ValueChanged<int> onItemSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final double width;
  final Duration duration;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
   List<Animation<double>> _animations;

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final intervalGap = 1 / widget.item.length;
    _animations = List.generate(
            widget.item.length,
            (index) => Tween(begin: 0.0, end: 1.6).animate(CurvedAnimation(
                parent: _animationController,
                curve: Interval(
                    index * intervalGap, index * intervalGap + intervalGap))))
        .toList();
    _animationController.forward(from: 1.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: LayoutBuilder(builder: (context, constraint) {
      final itemSize = constraint.maxHeight / widget.item.length;
      return AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return Stack(
              children: [
                widget.builder(() {
                  _animationController.reverse();
                }),
                for (int i = 0; i < widget.item.length; i++)
                  Positioned(
                    left: 0,
                    top: itemSize * i,
                    width: widget.width,
                    height: itemSize,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(
                          _animationController.status == AnimationStatus.reverse?
                               _animations[widget.item.length - 1 - i].value
                              : -_animations[i].value,
                        ),
                      alignment: Alignment.topLeft,
                      child: Material(
                        color: i == _selectedIndex?
                             widget.selectedColor
                            : widget.unselectedColor,
                        child: InkWell(
                          child: widget.item[i],
                          onTap: () {
                            _animationController.forward(from: 0.0);

                            if (i != 0) {
                              setState(() {
                                _selectedIndex = i;
                              });
                            }
                            widget.onItemSelected(i);
                          },
                        ),
                      ),
                    ),
                  )
              ],
            );
          });
    }));
  }
}
