import 'package:bobo_ui/authentication.dart';
import 'package:bobo_ui/components/add_reservation_ui.dart';
import 'package:bobo_ui/modals/reservation_modal.dart';
import 'package:bobo_ui/modules/company_modules/ticket_module.dart';
import 'package:bobo_ui/modules/reservation_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MpesaTopupModalReservation extends StatefulWidget {
  final ReservationModal reservationModal;

  MpesaTopupModalReservation({this.reservationModal});
  @override
  _MpesaTopupModalReservationState createState() => _MpesaTopupModalReservationState();
}

class _MpesaTopupModalReservationState extends State<MpesaTopupModalReservation> {
  BaseAuth auth = Auth(); 

  TextEditingController _phoneNoController;
  TextEditingController _amountController;
  TextEditingController _walletNoController;

  bool _phoneNoNull = true;
  bool _amountNull = true;
  bool _walletNoNull = true;

  bool _phoneNoError = false;
  bool _walletNoError = false;
  bool _amountError = false;
  bool _isLoading = false;
  bool _pasetNo = true;
  bool _pasetWallet = true;

  @override
  void initState() {
    super.initState();
    _phoneNoController = TextEditingController();
    _amountController = TextEditingController();
    _walletNoController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNoController.dispose();
    _amountController.dispose();
    _walletNoController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final ReservationModule reservationModule = Provider.of<ReservationModule>(context);
    
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      
      children: <Widget>[
        // PhoneNo
        TextField(
          controller: _phoneNoController,
          keyboardType: TextInputType.number,
          onChanged: (_text){
            setState(() {
              _phoneNoNull = _text == '';
              _phoneNoError = false;
            });
          },
          decoration: InputDecoration(
            labelText: "Phone Number",
            errorText: _phoneNoError ? "* Invalid Phone number" : null,
          ),
        
        ),
        // // Amount
        // TextField(
        //   controller: _amountController,
        //   keyboardType: TextInputType.number,
        //   onChanged: (_text){
        //     setState(() {
        //       _amountNull = _text == '';
        //       _amountError = false;
        //     });
        //   },
        //   decoration: InputDecoration(
        //     labelText: "Amount",
        //     errorText: _amountError ? "* Amount less than required" : null,
        //   ),
        // ),
        SizedBox(height: 8,),
        _isLoading ?
          CircularProgressIndicator() :
          RaisedButton(
            child: Text('"Pay now"'),
            onPressed: 
            ()async{
                setState(() {
                  _isLoading = true;
                });           
                reservationModule.addReservation = widget.reservationModal;   
              TicketModule ticketModule = TicketModule();
              bool _success = await ticketModule.payTicketMpesa(widget.reservationModal.totalCost, null, _phoneNoController.text);
              setState(() {
                _isLoading = false;
              });
              
              if(_success){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                
              }
              
            },
        ),
        
      ],
    );
  }
}