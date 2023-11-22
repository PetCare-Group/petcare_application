import 'package:flutter/material.dart';
import 'package:petcare_application/api/UserService.dart';
import 'package:intl/intl.dart';
import 'package:petcare_application/pref/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAppointmentScreen extends StatefulWidget {
  final UserService userService;

  const CreateAppointmentScreen({Key? key, required this.userService}) : super(key: key);

  @override
  _CreateAppointmentScreenState createState() => _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String paymentMethod = 'Yape/Plin';
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final TimeOfDayFormat timeFormat = TimeOfDayFormat.HH_colon_mm;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _saveAppointment() async {
    final appointmentDetails = {
      'firstName': widget.userService.user.firstName,
      'lastName': widget.userService.user.lastName,
      'location': widget.userService.location,
      'phone': widget.userService.phone,
      'price': widget.userService.price,
      'date': dateFormat.format(selectedDate),
      'startTime': selectedTime.format(context),
      'endTime': selectedTime.replacing(hour: selectedTime.hour + 3).format(context),
      'paymentMethod': paymentMethod,
    };

    // Utiliza la clase preferences para guardar la cita

    await preference().saveAppointmentDetails(appointmentDetails);

    // Regresar a la pantalla home
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cita'),
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Fecha de la cita: ${dateFormat.format(selectedDate)}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            ListTile(
              title: Text('Hora de inicio: ${selectedTime.format(context)}'),
              trailing: Icon(Icons.access_time),
              onTap: () => _selectTime(context),
            ),
            DropdownButtonFormField<String>(
              value: paymentMethod,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    paymentMethod = newValue;
                  });
                }
              },
              items: <String>['Yape/Plin', 'Transferencia Bancaria', 'Efectivo']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _saveAppointment,
              child: Text('Guardar Cita'),
            ),
          ],
        ),
      ),
    );
  }
}
