import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofsa_client_main/controller/home_controller.dart';
import 'package:ofsa_client_main/pages/product_details_page.dart';
import 'package:ofsa_client_main/pages/setting_page.dart';
import 'package:ofsa_client_main/widgets/drop_down_btn.dart';
import 'package:ofsa_client_main/widgets/multi_select_drop_down.dart';
import 'package:ofsa_client_main/widgets/product_card.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart'; // Import the ThemeProvider
import '../widgets/multi_select_popup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          await ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Online Furniture Selling App'),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_page),
                  title: Text('Contact Us'),
                  onTap: () {
                    // Handle contact us navigation
                  },
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.productCategory.length,
                  itemBuilder: (context, index) {
                    final category = ctrl.productCategory[index];
                    return InkWell(
                      onTap: () {
                        ctrl.filterByCategory(category.name ?? '');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Chip(label: Text(category.name ?? 'Error')),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: DropDownBtn(
                      items: ['Rs: Low to High', 'Rs: High to Low'],
                      selectedItemsText: 'Sort',
                      onSelected: (selected) {
                        ctrl.sortByPrice(
                            ascending: selected == 'Rs: Low to High');
                      },
                    ),
                  ),
                  Flexible(
                    child: MultiSelectDropDown(
                      items: ['Table', 'Chair', 'Bed', 'Desk', 'Cupboard', 'Sofa'], // Replace with your brand names
                      onSelectionChanged: (selectedItems) {
                        ctrl.filterByBrand(selectedItems); // Adjust the logic here as per your requirement
                        // print(selectedItems);
                      },
                    ),
                  ),

                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: ctrl.productShowInUi.length,
                  itemBuilder: (context, index) {
                    final product = ctrl.productShowInUi[index];
                    return ProductCard(
                      name: product.name ?? 'No name',
                      imageUrl: product.image ?? 'url',
                      price: product.price ?? 00,
                      offerTag: '30 % off',
                      onTap: () {
                        Get.to(
                              () => const ProductDetailsPage(),
                          arguments: {'data': product},
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
