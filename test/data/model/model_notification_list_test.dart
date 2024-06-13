import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:integra_mobile/data/model/model_notification_list.dart';

var json = {
  "current_page": 2,
  "data": [
    {
      "id": "d068c07e-9139-4000-8b73-7dbe0ef3629f",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "2f66a8d4-100f-4ac0-a818-b5c173931906",
      "created_at": "2024-06-09T16:58:55.000000Z",
      "updated_at": "2024-06-09T16:58:55.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan 2f66a8d4-100f-4ac0-a818-b5c173931906",
      "pengaduan": {
        "id": "2f66a8d4-100f-4ac0-a818-b5c173931906",
        "nama": "wahyu",
        "isi_pengaduan": "Pengaduan 1",
        "tanggal_pengaduan": "2024-06-07",
        "created_at": "2024-06-09T16:58:55.000000Z",
        "updated_at": "2024-06-09T17:07:36.000000Z",
        "gambar": "archive/image_2f66a8d4-100f-4ac0-a818-b5c173931906.jpg",
        "aplikasi": "1123123",
        "kantor": "tidak ada",
        "respon": "response tidak ada",
        "status_pengaduan": "reject",
        "user_id": 1,
        "tanggal_response": "2024-06-09",
        "tanggal_success": null
      }
    },
    {
      "id": "5862ab56-4d77-46cd-81d3-d50e97e4c239",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "83464267-090d-40c1-9606-b97b058b997d",
      "created_at": "2024-06-09T16:46:01.000000Z",
      "updated_at": "2024-06-09T16:46:01.000000Z",
      "title": "Pengaduan selesai",
      "body": "Pengaduan anda telah selesai di proses",
      "pengaduan": {
        "id": "83464267-090d-40c1-9606-b97b058b997d",
        "nama": "wahyu",
        "isi_pengaduan": "Pengaduan 1",
        "tanggal_pengaduan": "2024-06-07",
        "created_at": "2024-06-09T16:15:43.000000Z",
        "updated_at": "2024-06-09T16:46:01.000000Z",
        "gambar": "archive/image_83464267-090d-40c1-9606-b97b058b997d.jpg",
        "aplikasi": "1123123",
        "kantor": "tidak ada",
        "respon": "percobaan process",
        "status_pengaduan": "success",
        "user_id": 1,
        "tanggal_response": "2024-06-09",
        "tanggal_success": "2024-06-09"
      }
    },
    {
      "id": "d3b8edf5-b1c6-432b-96f7-6e9e642a79a4",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "83464267-090d-40c1-9606-b97b058b997d",
      "created_at": "2024-06-09T16:45:55.000000Z",
      "updated_at": "2024-06-09T16:45:55.000000Z",
      "title": "Response untuk pengaduan",
      "body": "Pengaduan anda telah di response oleh admin",
      "pengaduan": {
        "id": "83464267-090d-40c1-9606-b97b058b997d",
        "nama": "wahyu",
        "isi_pengaduan": "Pengaduan 1",
        "tanggal_pengaduan": "2024-06-07",
        "created_at": "2024-06-09T16:15:43.000000Z",
        "updated_at": "2024-06-09T16:46:01.000000Z",
        "gambar": "archive/image_83464267-090d-40c1-9606-b97b058b997d.jpg",
        "aplikasi": "1123123",
        "kantor": "tidak ada",
        "respon": "percobaan process",
        "status_pengaduan": "success",
        "user_id": 1,
        "tanggal_response": "2024-06-09",
        "tanggal_success": "2024-06-09"
      }
    },
    {
      "id": "2ac9fc06-385f-410a-ac0e-455e90450887",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "83464267-090d-40c1-9606-b97b058b997d",
      "created_at": "2024-06-09T16:15:43.000000Z",
      "updated_at": "2024-06-09T16:15:43.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan 83464267-090d-40c1-9606-b97b058b997d",
      "pengaduan": {
        "id": "83464267-090d-40c1-9606-b97b058b997d",
        "nama": "wahyu",
        "isi_pengaduan": "Pengaduan 1",
        "tanggal_pengaduan": "2024-06-07",
        "created_at": "2024-06-09T16:15:43.000000Z",
        "updated_at": "2024-06-09T16:46:01.000000Z",
        "gambar": "archive/image_83464267-090d-40c1-9606-b97b058b997d.jpg",
        "aplikasi": "1123123",
        "kantor": "tidak ada",
        "respon": "percobaan process",
        "status_pengaduan": "success",
        "user_id": 1,
        "tanggal_response": "2024-06-09",
        "tanggal_success": "2024-06-09"
      }
    }
  ],
  "first_page_url": "http://admin-pengaduan.test/api/notification?page=1",
  "from": 16,
  "last_page": 2,
  "last_page_url": "http://admin-pengaduan.test/api/notification?page=2",
  "links": [
    {
      "url": "http://admin-pengaduan.test/api/notification?page=1",
      "label": "&laquo; Previous",
      "active": false
    },
    {
      "url": "http://admin-pengaduan.test/api/notification?page=1",
      "label": "1",
      "active": false
    },
    {
      "url": "http://admin-pengaduan.test/api/notification?page=2",
      "label": "2",
      "active": true
    },
    {"url": null, "label": "Next &raquo;", "active": false}
  ],
  "next_page_url": null,
  "path": "http://admin-pengaduan.test/api/notification",
  "per_page": 15,
  "prev_page_url": "http://admin-pengaduan.test/api/notification?page=1",
  "to": 19,
  "total": 19
};
void main() {
  testWidgets('model notification list ...', (tester) async {
    ModelNotificationList.fromJson(json);
  });
}
