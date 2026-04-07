# Projeto Flutter - Gerenciador de Tarefas

Este é um aplicativo Flutter para organizar tarefas do dia a dia, com:
- Cadastro de novas tarefas
- Marcar como concluídas
- Remover tarefas
- Interface moderna com gradiente e efeito blur

## Estrutura do Código

### `lib/tarefa.dart`
Define a **classe Tarefa**, que é o modelo de dados:
- `titulo`: texto da tarefa.
- `concluida`: booleano que indica se está concluída.
- Métodos auxiliares como `alternarConclusao()` para mudar o estado.

### `lib/tarefas.dart`
Tela principal de tarefas:
- Usa `StatefulWidget` para manter a lista de tarefas.
- Funções:
  - `_adicionarTarefa(String titulo)`: adiciona uma nova tarefa.
  - `_removerTarefa(int index)`: remove uma tarefa.
  - `_alternarTarefa(int index)`: marca ou desmarca como concluída.
  - `_ordenarTarefas()`: organiza tarefas, deixando pendentes primeiro.
- Interface:
  - `ListView.builder` exibe cada tarefa em um **Card translúcido**.
  - `Checkbox` para marcar como concluída.
  - `IconButton` para excluir.
  - Botão **Nova tarefa** abre um `Dialog` estilizado com blur para cadastrar.

### `lib/main.dart`
Ponto de entrada do app:
- Configura o `MaterialApp`.
- Define a tela inicial e navegação para outras páginas (`login.dart`, `cadastro.dart`, `calendario.dart`, etc.).

### Outras telas
- `login.dart`: tela de login.
- `cadastro.dart`: tela de cadastro de usuário.
- `calendario.dart`: tela para escolher datas e visualizar tarefas.
- Cada arquivo segue o padrão Flutter de `StatelessWidget` ou `StatefulWidget`.

## Como rodar o projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/seuusuario/projeto_flutter.git
