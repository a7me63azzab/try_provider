import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginprovider/src/pages/HomePage/provider.dart';
import 'package:loginprovider/src/pages/HomePage/view.dart';
import 'package:loginprovider/src/pages/LoginPage/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginData loginData = LoginData();

  void _loginSubmitted(
      BuildContext context, LoginProvider loginProvider) async {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      bool isLoggedIn = await loginProvider.login(
          phone: loginData.phone, password: loginData.password);
      if (isLoggedIn) {
        _onHome(context);
      } else {
        _showErrorDialog(context, loginProvider.error);
      }
    }
  }

  void _showErrorDialog(BuildContext context, String err) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Error"),
            content: Text(err ?? ""),
            actions: <Widget>[
              CupertinoButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  Future<void> _onHome(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  setState(() {
                    loginData.phone = value;
                  });
                },
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                onSaved: (value) {
                  setState(() {
                    loginData.password = value;
                  });
                },
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              loginProvider.status == Status.LoginStart
                  ? Center(
                      child: CupertinoActivityIndicator(
                        animating: true,
                        radius: 15,
                      ),
                    )
                  : CupertinoButton.filled(
                      child: Text("Login"),
                      onPressed: () =>
                          _loginSubmitted(context, loginProvider),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginData {
  String phone;
  String password;

  LoginData({
    this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "password": password,
    };
  }
}
