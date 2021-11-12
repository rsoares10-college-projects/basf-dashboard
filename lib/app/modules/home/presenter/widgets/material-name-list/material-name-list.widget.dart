import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../dashboard/presenter/stores/dashboard.store.dart';

class MaterialNameList extends StatefulWidget {
  const MaterialNameList({
    Key? key,
  }) : super(key: key);

  @override
  _MaterialNameListState createState() => _MaterialNameListState();
}

class _MaterialNameListState extends ModularState<MaterialNameList, DashboardStore> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animationOne;
  late Animation<Color?> _animationTwo;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animationOne = ColorTween(begin: Colors.grey.shade100, end: Colors.deepPurpleAccent.shade100).animate(_controller);
    _animationTwo = ColorTween(begin: Colors.deepPurpleAccent.shade100, end: Colors.grey.shade100).animate(_controller);

    _controller.forward();

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => store.materialNameList == null
          ? ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    _animationOne.value!,
                    _animationTwo.value!,
                  ],
                ).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                height: double.infinity,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.deepPurple.shade50,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                    offset: Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: DropdownSearch<String>(
                mode: Mode.DIALOG,
                items: store.materialNameList,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Material",
                  contentPadding: EdgeInsets.all(5.0),
                  border: OutlineInputBorder(),
                ),
                onChanged: print,
                selectedItem: store.materialNameList?.first,
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Buscar...",
                  ),
                ),
                popupTitle: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade500,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Materiais',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
    );
  }
}
