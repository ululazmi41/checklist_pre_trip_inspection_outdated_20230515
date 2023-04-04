import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CheckTile extends StatefulWidget {
  const CheckTile({
    Key? key,
    required this.title,
    required this.state,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final int state;
  final Function onChange;

  @override
  State<CheckTile> createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  int state = 0;

  File? photofile;

  @override
  void initState() {
    state = widget.state;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: (() {
                  setState(() {
                    if (state < 3) {
                      state += 1;
                    } else {
                      state = 0;
                    }

                    widget.onChange(state);
                  });
                }),
                child: _conditionalContainer(state),
              ),
              const SizedBox(width: 32.0),
              photofile != null
                  ? Image.file(photofile!, width: 24.0, height: 24.0)
                  : InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);

                        if (photo != null) {
                          setState(() {
                            photofile = File(photo.path);
                          });
                        }
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
              const SizedBox(width: 4.0),
            ],
          ),
        ],
      ),
    );
  }

  Container _conditionalContainer(int state) {
    if (state == 0) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
        ),
      );
    } else if (state == 1) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: const Icon(
          Icons.check,
          size: 18,
          color: Colors.white,
        ),
      );
    } else if (state == 2) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: const Icon(
          Icons.remove,
          size: 18,
          color: Colors.white,
        ),
      );
    } else if (state == 3) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
        ),
        child: const Icon(
          Icons.close,
          size: 18,
          color: Colors.white,
        ),
      );
    } else {
      BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      );
    }

    return Container();
  }
}
