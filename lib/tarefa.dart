/// Classe que representa uma tarefa dentro do app.
/// Cada tarefa tem um título e um estado (concluída ou não).
class Tarefa {
  String titulo;
  bool concluida;

  /// Construtor: recebe o título e opcionalmente se já está concluída.
  Tarefa(this.titulo, {this.concluida = false});

  /// Método auxiliar para alternar o estado da tarefa.
  void alternarConclusao() {
    concluida = !concluida;
  }

  /// Representação em texto (útil para debug).
  @override
  String toString() {
    return 'Tarefa(titulo: $titulo, concluida: $concluida)';
  }
}
