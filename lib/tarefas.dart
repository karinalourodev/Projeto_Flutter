import 'dart:ui';
import 'package:flutter/material.dart';
import 'tarefa.dart';

class TarefasPage extends StatefulWidget {
  final DateTime dataSelecionada;
  const TarefasPage({super.key, required this.dataSelecionada});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  final List<Tarefa> tarefas = [];

  void _adicionarTarefa(String titulo) {
    setState(() {
      tarefas.add(Tarefa(titulo));
      _ordenarTarefas();
    });
  }

  void _removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  void _alternarTarefa(int index) {
    setState(() {
      tarefas[index].concluida = !tarefas[index].concluida;
      _ordenarTarefas();
    });
  }

  void _ordenarTarefas() {
    tarefas.sort((a, b) {
      if (a.concluida == b.concluida) {
        return a.titulo.compareTo(b.titulo);
      }
      return a.concluida ? 1 : -1; // pendentes primeiro
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.task_alt, size: 60, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                "Tarefas - ${widget.dataSelecionada.toLocal().toString().split(' ')[0]}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = tarefas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      color: Colors.white.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: tarefa.concluida,
                          onChanged: (_) => _alternarTarefa(index),
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                        ),
                        title: Text(
                          tarefa.titulo,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            decoration: tarefa.concluida
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => _removerTarefa(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  final TextEditingController controller =
                      TextEditingController();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.add_task,
                                    size: 50,
                                    color: Color.fromARGB(255, 15, 36, 195),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    "Cadastrar Nova Tarefa",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 26, 9, 213),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    controller: controller,
                                    decoration: InputDecoration(
                                      labelText: "Título da tarefa",
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                        255,
                                        61,
                                        15,
                                        214,
                                      ).withOpacity(0.3),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      labelStyle: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 51, 10, 218),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text(
                                          "Cancelar",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (controller.text.isNotEmpty) {
                                            _adicionarTarefa(controller.text);
                                          }
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white
                                              .withOpacity(0.4),
                                          foregroundColor: Colors.black,
                                          shape: const StadiumBorder(),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 12,
                                          ),
                                        ),
                                        child: const Text("Adicionar"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text("Nova tarefa"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ).withOpacity(0.4),
                  foregroundColor: Colors.black,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
