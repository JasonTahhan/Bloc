import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_event.dart';
import 'package:login/blocs/AuthenticationBloc/authentication_state.dart';
import 'package:login/blocs/PropertyBloc/property_bloc.dart';
import 'package:login/blocs/PropertyBloc/property_event.dart';
import 'package:login/blocs/PropertyBloc/property_state.dart';
import '../../Navigation/Navigator.dart';
import '../../data/Models/PropertyModel.dart';
import '../../data/Models/SpaceModel.dart';
import '../shared_widget/Carousel.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initiate();
  }

  void initiate() {
    context.read<PropertyBloc>().add(FetchedProperty());
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<AuthenticationBloc>().add(Signout());
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
         
    String? firstName = state.currentUser.firstName;
    String? lastName = state.currentUser.lastName;
            return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF3C4955),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              if (firstName != null && lastName != null)
                Text(
                  'Hello, $firstName $lastName',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                  },
                  enabled: !state.currentUser.isEmpty()
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text(!state.currentUser.isEmpty() ? 'Logout' : 'Login'),
                  onTap: () {
                    if (!state.currentUser.isEmpty()) {
                      _showLogoutConfirmationDialog();
                    } else {
                      NavigationService.pushReplacement('/SignIn');
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(390, 160),
        child: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            return SafeArea(
              child: AppBar(
                backgroundColor: Color(0xFF3C4955),
                toolbarHeight: 160,
                automaticallyImplyLeading: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                title: Column(
                  children: [
                    SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 14.0, 0),
                            child: SvgPicture.asset(
                              'assets/burger.svg',
                              color: Colors.white,
                              width: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<PropertyModel>(
                                    value: state.selectedProperty,
                                    items: state.listProperty
                                        .map(
                                          (prop) =>
                                              DropdownMenuItem<PropertyModel>(
                                            value: prop,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.0, 0, 24.0, 0),
                                              child: Text(
                                                prop.propertyName,
                                                style: TextStyle(
                                                  color: Color(0xFF3C4955),
                                                  fontSize: 14.0,
                                                  fontFamily: 'Monserrat',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: SvgPicture.asset(
                                      'assets/drop.svg',
                                      color: Color(0xFF3C4955),
                                      width: 20,
                                    ),
                                    onChanged: (prop) {
                                      BlocProvider.of<PropertyBloc>(context)
                                          .add(SetSelectedProperty(prop!));
                                    },
                                    hint: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0, 150.0, 0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/property.svg',
                                            color: Color(0xFF3C4955),
                                            width: 18,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Select property',
                                            style: TextStyle(
                                              color: Color(0xFF3C4955),
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 5.0, 0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: null,
                                      items: [],
                                      icon: SvgPicture.asset(
                                        'assets/drop.svg',
                                        color: Color(0xFF3C4955),
                                        width: 20,
                                      ),
                                      onChanged: (value) {},
                                      hint: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4.0, 0, 32, 0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/date.svg',
                                              color: Color(0xFF3C4955),
                                              width: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Select date',
                                              style: TextStyle(
                                                color: Color(0xFF3C4955),
                                                fontSize: 14.0,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromRGBO(178, 187, 202, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<String>(
                                    value: null,
                                    items: [],
                                    icon: SvgPicture.asset(
                                      'assets/drop.svg',
                                      color: Color(0xFF3C4955),
                                      width: 20,
                                    ),
                                    onChanged: (value) {},
                                    hint: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          2.0, 0, 4, 0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_add_outlined,
                                            color: Color(0xFF3C4955),
                                            size: 20,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Guests & Rooms',
                                            style: TextStyle(
                                              color: Color(0xFF3C4955),
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
            body: BlocBuilder<PropertyBloc, PropertyState>(
              
        builder: (context, state) {
          PropertyModel? selectedProperty =
              state.selectedProperty;
          if (selectedProperty == null) {
            return Center(child: Text('No property selected'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Available Properties',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedProperty.availableSpaces.length,
                  itemBuilder: (context, index) {
                    SpaceModel space = selectedProperty.availableSpaces[index];
                    return Carousel(
                      spaceImages: space.spaceImages,
                      spaceTitle: space.spaceTitle,
                      spaceDescription: space.spaceDescription,
                      spaceRating: space.spaceRating,
                      spacePrice: space.spacePrice,
                      propertyName: selectedProperty.propertyName,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
