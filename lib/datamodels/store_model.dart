class Stores
{
  String? storeUid;
  String? storeName;
  String? storeAvatarUrl;
  String? storeEmail;

  Stores({
    this.storeUid,
    this.storeName,
    this.storeAvatarUrl,
    this.storeEmail,
  });

  Stores.fromJson(Map<String, dynamic> json)
  {
    storeUid = json["storeUid"];
    storeName = json["storeName"];
    storeAvatarUrl = json["storeAvatarUrl"];
    storeEmail = json["storeEmail"];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["storeUid"] = this.storeUid;
    data["storeName"] = this.storeName;
    data["storeAvatarUrl"] = this.storeAvatarUrl;
    data["storeEmail"] = this.storeEmail;
    return data;
  }
}