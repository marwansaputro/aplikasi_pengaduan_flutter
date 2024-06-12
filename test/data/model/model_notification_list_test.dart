import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:integra_mobile/data/model/model_notification_list.dart';

var json = {
  "current_page": 1,
  "data": [
    {
      "id": "d13cd4ca-6903-4bac-88f3-d8330a30408f",
      "payload": "",
      "tanggal": "2024-06-11",
      "user_id": 1,
      "pengaduan_id": "612687bb-bf47-41f6-895b-759f2de79d47",
      "created_at": "2024-06-11T11:00:47.000000Z",
      "updated_at": "2024-06-11T11:00:47.000000Z",
      "title": "Pengaduan selesai",
      "body": "Pengaduan anda telah selesai di proses"
    },
    {
      "id": "de2b14be-6533-4d24-8731-29c3c60d2fd5",
      "payload": "",
      "tanggal": "2024-06-11",
      "user_id": 1,
      "pengaduan_id": "612687bb-bf47-41f6-895b-759f2de79d47",
      "created_at": "2024-06-11T11:00:33.000000Z",
      "updated_at": "2024-06-11T11:00:33.000000Z",
      "title": "Response untuk pengaduan",
      "body": "Pengaduan anda telah di response oleh admin"
    },
    {
      "id": "7ba6b67d-5bd3-4e09-b485-c152b341a092",
      "payload": "",
      "tanggal": "2024-06-11",
      "user_id": 1,
      "pengaduan_id": "612687bb-bf47-41f6-895b-759f2de79d47",
      "created_at": "2024-06-11T10:59:48.000000Z",
      "updated_at": "2024-06-11T10:59:48.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan 612687bb-bf47-41f6-895b-759f2de79d47"
    },
    {
      "id": "ae6c42a4-4d8e-4d2d-8a31-b6f6e565addb",
      "payload": "",
      "tanggal": "2024-06-10",
      "user_id": 1,
      "pengaduan_id": "b63a5b95-d140-4528-9979-f676f59f4132",
      "created_at": "2024-06-10T14:55:46.000000Z",
      "updated_at": "2024-06-10T14:55:46.000000Z",
      "title": "Pengaduan selesai",
      "body": "Pengaduan anda telah selesai di proses"
    },
    {
      "id": "39b8570a-323d-4f00-a445-f846543b1e57",
      "payload": "",
      "tanggal": "2024-06-10",
      "user_id": 1,
      "pengaduan_id": "37ce4e45-35f7-4f42-8418-bd5205114d61",
      "created_at": "2024-06-10T14:55:41.000000Z",
      "updated_at": "2024-06-10T14:55:41.000000Z",
      "title": "Pengaduan selesai",
      "body": "Pengaduan anda telah selesai di proses"
    },
    {
      "id": "5dd1233c-851a-4a1a-bc3e-488d22de3022",
      "payload": "",
      "tanggal": "2024-06-10",
      "user_id": 1,
      "pengaduan_id": "b63a5b95-d140-4528-9979-f676f59f4132",
      "created_at": "2024-06-10T14:55:28.000000Z",
      "updated_at": "2024-06-10T14:55:28.000000Z",
      "title": "Response untuk pengaduan",
      "body": "Pengaduan anda telah di response oleh admin"
    },
    {
      "id": "eba57cc6-292b-45ac-85ed-fe7a36a955b5",
      "payload": "",
      "tanggal": "2024-06-10",
      "user_id": 1,
      "pengaduan_id": "b63a5b95-d140-4528-9979-f676f59f4132",
      "created_at": "2024-06-10T14:54:48.000000Z",
      "updated_at": "2024-06-10T14:54:48.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan b63a5b95-d140-4528-9979-f676f59f4132"
    },
    {
      "id": "90a6b1a8-a39d-487f-b77e-2c423887d61b",
      "payload": "",
      "tanggal": "2024-06-10",
      "user_id": 1,
      "pengaduan_id": "37ce4e45-35f7-4f42-8418-bd5205114d61",
      "created_at": "2024-06-10T14:48:29.000000Z",
      "updated_at": "2024-06-10T14:48:29.000000Z",
      "title": "Response untuk pengaduan",
      "body": "Pengaduan anda telah di response oleh admin"
    },
    {
      "id": "be22ca18-d0f1-4968-aa6a-ac8db7366754",
      "payload": "",
      "tanggal": "2024-06-10",
      "user_id": 1,
      "pengaduan_id": "37ce4e45-35f7-4f42-8418-bd5205114d61",
      "created_at": "2024-06-10T14:08:23.000000Z",
      "updated_at": "2024-06-10T14:08:23.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan 37ce4e45-35f7-4f42-8418-bd5205114d61"
    },
    {
      "id": "e381fe41-5501-490d-b1a4-20b2da9fc6bc",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "aae147a3-a252-49bf-bb54-63a84e0e0768",
      "created_at": "2024-06-09T17:09:30.000000Z",
      "updated_at": "2024-06-09T17:09:30.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan aae147a3-a252-49bf-bb54-63a84e0e0768"
    },
    {
      "id": "90c80020-f8a0-48e8-9e49-84ddc9b5c17e",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "2f66a8d4-100f-4ac0-a818-b5c173931906",
      "created_at": "2024-06-09T17:07:36.000000Z",
      "updated_at": "2024-06-09T17:07:36.000000Z",
      "title": "Response untuk pengaduan",
      "body": "Pengaduan ditolak oleh admin"
    },
    {
      "id": "d068c07e-9139-4000-8b73-7dbe0ef3629f",
      "payload": "",
      "tanggal": "2024-06-09",
      "user_id": 1,
      "pengaduan_id": "2f66a8d4-100f-4ac0-a818-b5c173931906",
      "created_at": "2024-06-09T16:58:55.000000Z",
      "updated_at": "2024-06-09T16:58:55.000000Z",
      "title": "Pengaduan baru",
      "body": "Pengaduan baru dengan 2f66a8d4-100f-4ac0-a818-b5c173931906"
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
      "body": "Pengaduan anda telah selesai di proses"
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
      "body": "Pengaduan anda telah di response oleh admin"
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
      "body": "Pengaduan baru dengan 83464267-090d-40c1-9606-b97b058b997d"
    }
  ],
  "first_page_url": "http://admin-pengaduan.test/api/notification?page=1",
  "from": 1,
  "last_page": 1,
  "last_page_url": "http://admin-pengaduan.test/api/notification?page=1",
  "links": [
    {"url": null, "label": "&laquo; Previous", "active": false},
    {
      "url": "http://admin-pengaduan.test/api/notification?page=1",
      "label": "1",
      "active": true
    },
    {"url": null, "label": "Next &raquo;", "active": false}
  ],
  "next_page_url": null,
  "path": "http://admin-pengaduan.test/api/notification",
  "per_page": 15,
  "prev_page_url": null,
  "to": 15,
  "total": 15
};
void main() {
  testWidgets('model notification list ...', (tester) async {
    ModelNotificationList.fromJson(jsonDecode(json.toString()));
  });
}
