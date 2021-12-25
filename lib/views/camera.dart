import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const Camera({Key? key, required this.cameras}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    if (widget.cameras.length > 1) {
      controller = CameraController(widget.cameras[1], ResolutionPreset.max);
    } else {
      controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    }
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
      ),
      body: (!controller.value.isInitialized)
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CameraPreview(controller),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        enableFeedback: true,
                        splashColor: Colors.blueGrey,
                        icon: const Icon(Icons.camera_enhance_outlined),
                        onPressed: () async {
                          pictureFile = await controller.takePicture();
                          if (pictureFile != null) {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      title: const Text("Captured  Image",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold)),
                                      content:
                                          Platform.isAndroid || Platform.isIOS
                                              ? Image.file(
                                                  File(pictureFile!.path),
                                                )
                                              : Image.network(
                                                  pictureFile!.path,
                                                ),
                                      actions: [
                                        OutlinedButton(
                                            child: const Text("Save",
                                                style: TextStyle(
                                                  color: Colors.deepOrange,
                                                )),
                                            onPressed: () async {
                                              GallerySaver.saveImage(pictureFile!.path);
                                              Navigator.pop(context);
                                            }),
                                        OutlinedButton(
                                            child: const Text(
                                              "Retake",
                                              style: TextStyle(
                                                  color: Colors.blueGrey),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    ));
                          }
                          // setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
