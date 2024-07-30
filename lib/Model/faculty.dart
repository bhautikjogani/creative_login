class Credential {
  String? domain;
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? status;
  String? role;
  String? password;
  String? image;
  String? branchId;
  String? deptId;
  String? punchcode;
  String? fullname;
  String? designation;
  String? salary;
  String? proTax;
  String? paymentMode;
  String? department;
  String? groupId;
  String? token;
  String? error;

  Credential(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.status,
      this.role,
      this.password,
      this.image,
      this.branchId,
      this.deptId,
      this.punchcode,
      this.fullname,
      this.designation,
      this.salary,
      this.proTax,
      this.paymentMode,
      this.department,
      this.groupId,
      this.token,
      this.error});

  Credential.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    status = json['status'];
    role = json['role'];
    password = json['password'];
    image = json['image'];
    branchId = json['branch_id'];
    deptId = json['dept_id'];
    punchcode = json['punchcode'];
    fullname = json['fullname'];
    designation = json['designation'];
    salary = json['salary'];
    proTax = json['pro_tax'];
    paymentMode = json['payment_mode'];
    department = json['department'];
    groupId = json['group_id'];
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domain'] = domain;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['status'] = status;
    data['role'] = role;
    data['password'] = password;
    data['image'] = image;
    data['branch_id'] = branchId;
    data['dept_id'] = deptId;
    data['punchcode'] = punchcode;
    data['fullname'] = fullname;
    data['designation'] = designation;
    data['salary'] = salary;
    data['pro_tax'] = proTax;
    data['payment_mode'] = paymentMode;
    data['department'] = department;
    data['group_id'] = groupId;
    data['token'] = token;
    data['error'] = error;
    return data;
  }
}
