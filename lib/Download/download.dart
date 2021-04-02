import 'dart:io';

import 'package:flutter_samples/Download/widget/progress.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String descargando = '';
  bool descarga = false;
  double _porcentaje = 0.0;
   Directory dir;
  double porcentaje = 0.0;

   File file;
  void downLoad() async {
    descarga = !descarga;
    try {
      dir = (await getExternalStorageDirectory());
      var urlPath = 'https://sample-videos.com/img/Sample-jpg-image-1mb.jpg';
      print('${dir.path}/sample.jpg');
      Dio dio = Dio();

      dio.download(urlPath, '${dir.path}/sample.jpg',
          onReceiveProgress: (actual, total) {
        setState(() {
          porcentaje = actual / total * 100;
          _porcentaje = porcentaje / 100;
          descargando = 'Descargando... ${porcentaje.floor()}%';

          file = File('${dir.path}/sample.jpg');
        });
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(porcentaje);
    return Scaffold(
      appBar: AppBar(
        title: Text('Download image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: _porcentaje == 1
                    ? Image.file(
                        file,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.image_outlined,
                        size: 150,
                        color: Colors.grey,
                      ),
              ),
            ),

            Progress(
              descarga: descarga,
              value: _porcentaje,
              onPressed: downLoad,
            )
            // !descarga
            //     ? FloatingActionButton.extended(
            //         onPressed: downLoad,
            //         label: Text('Descargar'),
            //       )
            //     : Column(
            //         children: [
            //           CircularProgressIndicator(
            //               value: _porcentaje, backgroundColor: Colors.grey),
            //           Text(descargando ?? ''),
            //         ],
            //       ),
          ],
        ),
      ),
    );
  }
}
