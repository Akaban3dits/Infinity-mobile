import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferenceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencestate.dart';

class ButtonPearson extends StatefulWidget {
  final String name;
  final String linkImageProfile;
  final String accountNum;
  final String owner;
  final String accountowner;
  final VoidCallback onSuccess;

  const ButtonPearson({
    super.key,
    required this.linkImageProfile,
    required this.name,
    required this.accountNum,
    required this.owner,
    required this.accountowner,
    required this.onSuccess,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ButtonPearsonState createState() => _ButtonPearsonState();
}

class _ButtonPearsonState extends State<ButtonPearson> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _display(context);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fixedSize: const Size(100, 110),
        backgroundColor: AppColorStyle.secundary2,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.grey[300],
              child: Image.network(
                widget.linkImageProfile,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.name,
            style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
          ),
        ],
      ),
    );
  }

  Future<void> _display(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColorStyle.secundary2,
      barrierColor: Colors.black38.withOpacity(0),
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) => BlocListener<TransferenceBloc, TransferenceState>(
        listener: (context, state) {
          if (state is TransferenceCreated) {
            _clearFields();
            Navigator.pop(context); // Cerrar el modal
            _showResponseDialog(
                context, 'La transferencia se ha realizado con éxito.');
          } else if (state is TransferenceError) {
            _showErrorDialog(context, state.message);
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              _buildLabel("Concepto"),
              _buildTextField(titleController, 'Ingresa tu concepto', (value) {
                context.read<TransferenceBloc>().add(ConceptChanged(value));
              }),
              _buildLabel("Monto"),
              _buildAmountField(),
              _buildLabel("Transferencia a:"),
              _buildRecipientInfo(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        "Cancel operation",
                        style: AppTextStyles.h4s1
                            .copyWith(color: AppColorStyle.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 30),
        Text(text,
            style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: SizedBox(
        height: 60,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: AppColorStyle.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.h4s1,
          ),
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: SizedBox(
        height: 60,
        child: TextField(
          controller: bodyController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
          ],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty) {
              double amount =
                  double.tryParse(value.replaceAll(',', '')) ?? 0.00;
              // Formatear y actualizar el controlador
              String formattedAmount = amount.toStringAsFixed(2);
              if (value != formattedAmount) {
                bodyController.value = TextEditingValue(
                  text: formattedAmount,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: formattedAmount.length),
                  ),
                );
              }
              context.read<TransferenceBloc>().add(AmountChanged(amount));
            }
          },
          decoration: InputDecoration(
            fillColor: AppColorStyle.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Ingresa tu monto',
            hintStyle: AppTextStyles.h4s1,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.attach_money,
                color: Colors.grey,
              ),
            ),
            prefixText: ' ',
            prefixStyle: const TextStyle(color: Colors.black),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              double amount = double.parse(value.replaceAll(',', ''));
              String formattedAmount = amount.toStringAsFixed(2);
              bodyController.value = TextEditingValue(
                text: formattedAmount,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: formattedAmount.length),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildRecipientInfo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 370,
        height: 80,
        decoration: BoxDecoration(
          color: AppColorStyle.primary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.grey[300],
                child: Image.network(
                  widget.linkImageProfile,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style:
                      AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.accountNum,
                  style:
                      AppTextStyles.h4s2.copyWith(color: AppColorStyle.white),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    bodyController.text.isNotEmpty) {
                  _showConfirmationDialog(context, () {
                    final concept = titleController.text;
                    final amount = double.parse(bodyController.text);
                    if (widget.accountNum.isNotEmpty) {
                      final transference = Transference(
                        owner: widget.owner,
                        amount: amount,
                        concept: concept,
                        senderAccount: widget.accountowner,
                        receptorAccount: widget.accountNum,
                      );

                      context.read<TransferenceBloc>().add(
                            CreateTransferenceEvent(transference),
                          );
                    } else {
                      _showErrorDialog(
                          context, 'El número de cuenta no debe estar vacío');
                    }
                  });
                } else {
                  _showErrorDialog(context,
                      'Por favor complete los campos de concepto y monto');
                }
              },
              icon: const Icon(Icons.send),
              color: AppColorStyle.white,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Transferencia'),
          content: const Text(
              '¿Estás seguro de que deseas enviar esta transferencia?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm(); // Llama a la función de confirmación
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void _showResponseDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado de la Operación'),
          content: Text(message),
        );
      },
    );

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context)
          .pop(true);
    });
  }

  void _clearFields() {
    titleController.clear();
    bodyController.clear();
  }
}
