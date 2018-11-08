import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily:'quicksand'),
      title: 'Registration Page',
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget{
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _name;
  String _email;
  String _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Name : $_name, Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("Form Page"),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Name"),
                  onSaved: (val) => _name = val,

                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Email"),
                  validator: (val) =>
                  !val.contains('@') ? 'Invalid Email' : null,
                  onSaved: (val) => _email = val,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (val) =>
                  val.length < 6 ? 'Password too short' : null,
                  onSaved: (val) => _password = val,
                  obscureText: true,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Comfirm Password"),
                  validator: (val) =>
                  val.length < 6 ? 'Password too short' : null,
                  obscureText: true,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "Register",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}