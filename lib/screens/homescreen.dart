import 'package:deleteapi/model/response_model.dart';
import 'package:deleteapi/screens/edit_screen.dart';
import 'package:deleteapi/services/dio_delete_api_services.dart';
import 'package:deleteapi/services/dio_get_api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late Future<List<ResponseModel>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = DioApiService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: futureData,
              builder: (context, snapshot) {
                List<ResponseModel> receivedData = snapshot.data ?? [];
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: receivedData.length,
                  itemBuilder: (context, index) {
                    ResponseModel data = receivedData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        children: [
                          ListTile(
                            iconColor: Colors.white,
                            tileColor: Colors.blue,
                            textColor: Colors.white,
                            leading: Text(data.id.toString()),
                            title: Text(data.name),
                            subtitle: Text(data.email),
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      int deleteId2 = data.id;
                                      setState(() {
                                        if (deleteId2 == data.id) {
                                          DeleteApi.deleteData(id: data.id);
                                          futureData = DioApiService.getData();
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    title: const Text(
                                                        'User Deleted'),
                                                    content: Text(
                                                        'name: ${data.name},id : ${data.id},email : ${data.email} is Deleted'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ));
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EditScreen(),
                                          ));
                                      // RequestModel requestModel =
                                      //     RequestModel(
                                      //         email: 'update23@gmail.com',
                                      //         name: 'update',
                                      //         gender: 'male',
                                      //         status: 'active');
                                      // UpdateApi.updateData(
                                      //     requestModel, data.id);
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
