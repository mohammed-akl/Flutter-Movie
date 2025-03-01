import 'dart:convert' show json;

class NotificationList {
  List<NotificationModel> notifications;
  factory NotificationList(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new NotificationList.fromJson(json.decode(jsonStr))
          : new NotificationList.fromJson(jsonStr);
  NotificationList.fromParams({this.notifications});
  NotificationList.fromJson(jsonRes) {
    notifications = jsonRes['notifications'] == null ? null : [];
    for (var resultsItem
        in notifications == null ? [] : jsonRes['notifications']) {
      notifications
          .add(resultsItem == null ? null : NotificationModel(resultsItem));
    }
  }
  @override
  String toString() {
    return '{"notifications": $notifications}';
  }
}

class NotificationModel {
  NotificationData notification;
  String date;
  String id;
  String type;
  String name;
  String streamLinkId;
  String posterPic;
  bool read;

  NotificationModel.fromParams(
      {this.id,
      this.name,
      this.posterPic,
      this.streamLinkId,
      this.type,
      this.date,
      this.notification,
      this.read});

  factory NotificationModel(dynamic mapRes) => mapRes is String
      ? NotificationModel.fromJson(json.encode(mapRes))
      : NotificationModel.fromMap(mapRes);

  NotificationModel.fromMap(mapRes) {
    id = mapRes['id'] == null ? null : mapRes['id'];
    type = mapRes['type'] == null ? null : mapRes['type'];
    name = mapRes['name'] == null ? null : mapRes['name'];
    streamLinkId =
        mapRes['streamLinkId'] == null ? null : mapRes['streamLinkId'];
    posterPic = mapRes['posterPic'] == null ? null : mapRes['posterPic'];
    read = mapRes['read'] == null ? false : mapRes['read'];
    date = mapRes['date'] == null ? DateTime.now().toString() : mapRes['date'];
    notification = mapRes['notification'] == null
        ? null
        : NotificationData(mapRes['notification']);
  }

  NotificationModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    type = jsonRes['type'];
    name = jsonRes['name'];
    streamLinkId = jsonRes['streamLinkId'];
    posterPic = jsonRes['posterPic'];
    date = jsonRes['date'];
    read = jsonRes['read'] == null ? false : jsonRes['read'];
    notification = jsonRes['notification'] == null
        ? null
        : NotificationData.fromJson(jsonRes['notification']);
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"read": $read,"date": ${date != null ? '${json.encode(date)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"streamLinkId": ${streamLinkId != null ? '${json.encode(streamLinkId)}' : 'null'},"posterPic": ${posterPic != null ? '${json.encode(posterPic)}' : 'null'},"notification": $notification}';
  }
}

class NotificationData {
  String title;
  String body;
  String image;

  NotificationData.fromParams({
    this.body,
    this.image,
    this.title,
  });

  factory NotificationData(Map mapRes) => NotificationData.fromMap(mapRes);

  NotificationData.fromMap(mapRes) {
    title = mapRes['title'] == null ? null : mapRes['title'];
    body = mapRes['body'] == null ? null : mapRes['body'];
    image = mapRes['image'] == null ? null : mapRes['image'];
  }

  NotificationData.fromJson(jsonRes) {
    title = jsonRes['title'];
    body = jsonRes['body'];
    image = jsonRes['image'];
  }

  @override
  String toString() {
    return '{"title": ${title != null ? '${json.encode(title)}' : 'null'},"body": ${body != null ? '${json.encode(body)}' : 'null'},"image": ${image != null ? '${json.encode(image)}' : 'null'}}';
  }
}
