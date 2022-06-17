import 'package:accompany/features/notifications_add/notifications_add_view.dart';
import 'package:flutter/material.dart';

import 'notifications_select_people_viewmodel.dart';

class NotificationsAddPeople extends StatefulWidget {
  const NotificationsAddPeople({Key? key}) : super(key: key);

  @override
  State<NotificationsAddPeople> createState() => _NotificationsAddPeopleState();
}

class _NotificationsAddPeopleState extends NotificationsAddPeopleViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Please Select People"),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Visibility(
                  child: Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      color: selectedItems.isNotEmpty
                          ? Colors.black
                          : Colors.black54,
                      onPressed: selectedItems.isNotEmpty
                          ? () {
                              //todo nav push yaparak bu verileri göndermelisin
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNotification(
                                      selectedUsers: selectedItems),
                                ),
                              );
                            }
                          : null,
                      icon: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: contactList?.length ?? 0,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                      child: Card(
                        child: Container(
                          // ignore: iterable_contains_unrelated_type
                          color: (checkContains(contactList?[index].id))
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.transparent,
                          child: ListTile(
                            title: Text(
                                '${contactList?[index].name} ${contactList?[index].surname} - ${contactList?[index].departmant}'),
                            onLongPress: () {
                              addSelected(
                                  contactList?[index].id,
                                  contactList?[index].fcmToken,
                                  contactList?[index].name,
                                  contactList?[index].surname,
                                  contactList?[index].departmant);
                            },
                            onTap: () {
                              removeSelected(contactList?[index].id);
                            },
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          )),
    );
  }
}
