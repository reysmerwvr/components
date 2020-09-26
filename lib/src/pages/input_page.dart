import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password;
  String _date = "";
  String _selectedOption = "Fly";

  List<String> _powers = ["Fly", "X Rays", "Super Power"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text("Letters ${_name.length}"),
          hintText: "Person Name",
          labelText: "Name",
          helperText: "First Name",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Email",
            labelText: "Email",
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Password",
            labelText: "Password",
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        onChanged: (value) => setState(() {
              _password = value;
            }));
  }

  Widget _createDate(context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
            hintText: "DOB",
            labelText: "DOB",
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  void _selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      // locale: Locale('es', 'ES'),
    );
    if (picker != null) {
      setState(() {
        _date = picker.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return list;
  }

  _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getDropdownOptions(),
            onChanged: (option) {
              setState(() {
                _selectedOption = option;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text("Name is: $_name"),
      subtitle: Text("Email is: $_email"),
    );
  }
}
