import 'package:evently_app/config/routes/app_routes.dart';
import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/feature/Home/presentation/views/love_tap.dart';
import 'package:evently_app/feature/Home/presentation/views/map_tap.dart';
import 'package:evently_app/feature/Home/presentation/views/profile_tap.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:evently_app/feature/Home/presentation/views/home_tap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> views = [HomeTap(), MapTap(), LoveTap(), ProfileTap()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: views[selectedIndex],

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryLight,
        onPressed: () {
          context.pushNamed(AppRoutes.addEvent);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Theme.of(context).primaryColor,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(
                selectedIcon: Icons.home,
                unSelectedIcon: Icons.home_outlined,
                index: 0,
                label: AppLocalizations.of(context)!.home,
              ),
              _navItem(
                selectedIcon: Icons.location_on,
                unSelectedIcon: Icons.location_on_outlined,
                index: 1,
                label: AppLocalizations.of(context)!.map,
              ),

              const SizedBox(width: 40),

              _navItem(
                selectedIcon: Icons.favorite,
                unSelectedIcon: Icons.favorite_border,
                index: 2,
                label: AppLocalizations.of(context)!.love,
              ),
              _navItem(
                selectedIcon: Icons.person,
                unSelectedIcon: Icons.person_outline,
                index: 3,
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData selectedIcon,
    required IconData unSelectedIcon,
    required int index,
    required String label,
  }) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selectedIcon : unSelectedIcon,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}




// class HomeView extends StatefulWidget {
//   HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final List<Widget> views = [HomeTap(), MapTap(), LoveTap(), ProfileTap()];
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: views[selectedIndex],
     
     
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor:Colors.transparent,
          
//         ),
//         child: BottomAppBar(
//           color: context.themeProvider.themeApp.primaryColor,
//           shape: CircularNotchedRectangle(
            
//           ),
//           notchMargin: 12,
          
          
//           padding: EdgeInsets.zero,
//           child: BottomNavigationBar(
//             elevation: 0,
            
//             unselectedItemColor:AppColors.whiteBgColor, 
//             selectedItemColor: AppColors.whiteBgColor,
           
//             onTap: (index) {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             // backgroundColor: AppColors.primaryDark,
//             // type: BottomNavigationBarType.fixed,
//             currentIndex: selectedIndex,
//              items: [
//               _bottomNavigationBarItem(
//           SelectedIcon: Icons.home,
//           unSelectedIcon: Icons.home_outlined,
//           label: AppLocalizations.of(context)!.home,
//           index: 0,
//               ),
//               _bottomNavigationBarItem(
//             SelectedIcon: Icons.location_on,
//             unSelectedIcon: Icons.location_on_outlined,
//             label: AppLocalizations.of(context)!.map,
//             index: 1,
//           ),
          
//               _bottomNavigationBarItem(
//           SelectedIcon: Icons.favorite,
//           unSelectedIcon: Icons.favorite_border,
//           label: AppLocalizations.of(context)!.love,
//           index: 2,
//               ),
//               _bottomNavigationBarItem(
//           SelectedIcon: Icons.person,
//           unSelectedIcon: Icons.person_outline,
//           label: AppLocalizations.of(context)!.profile,
//           index: 3,
//               ),
//             ],
//           ),
//         ),
     
     
//       ),
   
//    floatingActionButton: FloatingActionButton(onPressed: (){},
//     child: Icon(Icons.add, color: AppColors.whiteColor,size: 30,),
   
//    ),

//    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }

//   BottomNavigationBarItem _bottomNavigationBarItem({
//     required IconData unSelectedIcon,
//     required IconData SelectedIcon,
//     required int index,
//     required String label,
//   }) {
//     return BottomNavigationBarItem(
//       icon: index == selectedIndex ? Icon(SelectedIcon,) 
//       : Icon(unSelectedIcon),
//       label: label,
      
      
//     );
//   }
// }
