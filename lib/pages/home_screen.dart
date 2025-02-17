import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Hasan Shop",style: TextStyle(fontWeight: FontWeight.w700),),centerTitle: true,backgroundColor: Colors.deepOrangeAccent,foregroundColor: Colors.white,),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Hasan Shop",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.white,
            floating: true,
            pinned: false,
            snap: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "Item $index",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Items',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          //disable default onTap to avoid closing menu when selecting an item
                          enabled: false,
                          child: StatefulBuilder(
                            builder: (context, menuSetState) {
                              final isSelected = selectedItems.contains(item);
                              return InkWell(
                                onTap: () {
                                  isSelected ? selectedItems.remove(item) : selectedItems.add(item);
                                  //This rebuilds the StatefulWidget to update the button's text
                                  //setState(() {});
                                  //This rebuilds the dropdownMenu Widget to update the check mark
                                  menuSetState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      if (isSelected)
                                        const Icon(Icons.check_box_outlined)
                                      else
                                        const Icon(Icons.check_box_outline_blank),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                      //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                      value: selectedItems.isEmpty ? null : selectedItems.last,
                      onChanged: (value) {},
                      selectedItemBuilder: (context) {
                        return items.map(
                              (item) {
                            return Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                selectedItems.join(', '),
                                style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            );
                          },
                        ).toList();
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Colors.deepOrange
                          )
                        )
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: MediaQuery.of(context).size.width > 600 ?EdgeInsets.symmetric(horizontal: 20,vertical: 20):EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                  crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 20 : 10,
                  mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 20 : 10,
                  mainAxisExtent: 300,
                ),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Expanded(
                        flex:1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)
                          ),
                          child: Image.network(
                            width: double.infinity,
                            fit: BoxFit.fill,
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQJ36K6AAatnpKbrDV5TlOshRo_hJL3RXREA&s"
                          ),
                        )
                      ),
                      Expanded(
                        flex:1,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                            )
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
