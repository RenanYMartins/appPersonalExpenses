import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key, required this.onSubmit});

  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: valueController,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal:
                        true), // o ".number" poderia atender, mas no IOS iria faltar os separadores de casas decimais
                onSubmitted: (_) => _submitForm(), // (_) significa que o parametro passado na função será ignorado
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.purple),
                    onPressed: _submitForm,
                    child: const Text('Nova Transação'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
