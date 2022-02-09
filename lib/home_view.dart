import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:awesome_contact_app/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Yvonne Foster",
      "phone": "1-265-491-8411",
      "email": "molestie.in.tempus@google.edu",
      "region": "New South Wales",
      "country": "India"
    },
    {
      "name": "Lane Mcguire",
      "phone": "783-8429",
      "email": "aliquet.molestie@aol.couk",
      "region": "Guanacaste",
      "country": "Colombia"
    },
    {
      "name": "Brian Mejia",
      "phone": "227-7524",
      "email": "lorem.ut@yahoo.com",
      "region": "Huáběi",
      "country": "Colombia"
    },
    {
      "name": "Courtney Morris",
      "phone": "1-248-656-4771",
      "email": "mi.pede.nonummy@protonmail.net",
      "region": "Noord Holland",
      "country": "Netherlands"
    },
    {
      "name": "Riley Boyer",
      "phone": "1-453-610-0860",
      "email": "at.pede@aol.com",
      "region": "South Chungcheong",
      "country": "France"
    },
    {
      "name": "Lesley Frazier",
      "phone": "1-233-689-6038",
      "email": "rutrum.non@hotmail.net",
      "region": "Viken",
      "country": "Mexico"
    },
    {
      "name": "Octavius Fernandez",
      "phone": "1-821-762-5521",
      "email": "dui.suspendisse@protonmail.org",
      "region": "North Island",
      "country": "Russian Federation"
    },
    {
      "name": "Ashely Torres",
      "phone": "1-502-661-1656",
      "email": "nunc.mauris.elit@aol.com",
      "region": "Hà Nội",
      "country": "Pakistan"
    },
    {
      "name": "Derek Stanley",
      "phone": "475-5125",
      "email": "metus@google.edu",
      "region": "Xīběi",
      "country": "Vietnam"
    },
    {
      "name": "Demetria Craig",
      "phone": "686-4677",
      "email": "primis.in@protonmail.ca",
      "region": "Amur Oblast",
      "country": "Brazil"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                name: 'Ashely Torres',
                                phone: '1-502-661-1656',
                                email: 'nunc.mauris.elit@aol.com',
                                region: 'Hà Nội',
                                country: 'Pakistan'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/bird.jpg'),
                    ),
                    title: const Text(
                      'Ashely Torres',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('1-502-661-1656'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/bird.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
