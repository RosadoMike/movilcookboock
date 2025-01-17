import 'package:flutter/material.dart';

void main() => runApp(const Formss());

class Formss extends StatelessWidget {
  const Formss({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabbed Forms Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const TabbedFormsScreen(),
    );
  }
}

class TabbedFormsScreen extends StatelessWidget {
  const TabbedFormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Cinco pestañas para los cinco formularios
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabbed Forms Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Form Validation'),
              Tab(text: 'Styled Form'),
              Tab(text: 'Text Field Focus'),
              Tab(text: 'Handle Changes'),
              Tab(text: 'Retrieve Input'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FormValidation(),     // Primer formulario
            StyledForm(),         // Segundo formulario
            TextFieldFocusForm(), // Tercer formulario
            HandleChangesForm(),  // Cuarto formulario
            RetrieveInputForm(),  // Quinto formulario
          ],
        ),
      ),
    );
  }
}

// Primer formulario: Validación de formulario
class FormValidation extends StatelessWidget {
  const FormValidation({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const MyCustomFormValidation(),
    );
  }
}

class MyCustomFormValidation extends StatefulWidget {
  const MyCustomFormValidation({super.key});

  @override
  MyCustomFormValidationState createState() {
    return MyCustomFormValidationState();
  }
}

class MyCustomFormValidationState extends State<MyCustomFormValidation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

// Segundo formulario: Formulario estilizado
class StyledForm extends StatelessWidget {
  const StyledForm({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const MyCustomStyledForm(),
    );
  }
}

class MyCustomStyledForm extends StatelessWidget {
  const MyCustomStyledForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
      ],
    );
  }
}

// Tercer formulario: Text Field Focus
class TextFieldFocusForm extends StatefulWidget {
  const TextFieldFocusForm({super.key});

  @override
  State<TextFieldFocusForm> createState() => _TextFieldFocusFormState();
}

class _TextFieldFocusFormState extends State<TextFieldFocusForm> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              autofocus: true,
            ),
            TextField(
              focusNode: myFocusNode,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myFocusNode.requestFocus(),
        tooltip: 'Focus Second Text Field',
        child: const Icon(Icons.edit),
      ),
    );
  }
}

// Cuarto formulario: Manejo de cambios en un campo de texto
class HandleChangesForm extends StatefulWidget {
  const HandleChangesForm({super.key});

  @override
  State<HandleChangesForm> createState() => _HandleChangesFormState();
}

class _HandleChangesFormState extends State<HandleChangesForm> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Changes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                print('First text field: $text');
              },
              decoration: const InputDecoration(
                labelText: 'First Field',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                labelText: 'Second Field',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Quinto formulario: Recuperar entrada de texto
class RetrieveInputForm extends StatefulWidget {
  const RetrieveInputForm({super.key});

  @override
  State<RetrieveInputForm> createState() => _RetrieveInputFormState();
}

class _RetrieveInputFormState extends State<RetrieveInputForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
          decoration: const InputDecoration(labelText: 'Enter some text'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show Text',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
