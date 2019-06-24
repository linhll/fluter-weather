class Cloud {
  num all;

  Cloud() {
    this.all = 0;
  }

  Cloud.fromJson(Map json) {
    this.all = json['all'];
  }

  Map toJson() {
    return {'all': all};
  }
}
