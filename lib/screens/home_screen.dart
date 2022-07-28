import 'package:flutter/material.dart';
import 'package:gallery_app/db/functions/db_functions.dart';
import 'package:gallery_app/db/model/data_model.dart';
import 'package:gallery_app/widgets/display_image_widget.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getAllStudents();
    super.initState();
  }

  late String _imageData;
  late int length;
  @override
  Widget build(BuildContext context) {
    // clearAllStudents();
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black, shape: const CircleBorder()),
        onPressed: () {
          pickMedia();
        },
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Icon(
            Icons.camera_alt_rounded,
            size: 37,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 10,
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ValueListenableBuilder(
            valueListenable: galleryImageNotifier,
            builder: (BuildContext context, List<GalleryModel> studentList,
                Widget? child) {
              length = studentList.length;
              return (length == 0)
                  ? const Center(
                      child: Text('No photos available'),
                    )
                  : GridView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        final data = studentList[index];
                        return ImageCard(
                          path: data.image,
                        );
                      },
                      itemCount: studentList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 7),
                    );
            }),
      ),
    );
  }

  Future<void> pickMedia() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    _imageData = image.path;
    final picture = GalleryModel(image: _imageData);
    addStudent(picture);
  }
}
