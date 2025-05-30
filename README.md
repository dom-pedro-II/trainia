# 🧠 Personalized Training Planner – Flutter + Gemini

Este é um aplicativo Flutter que coleta informações do usuário (atleta) e gera automaticamente um **plano de treino semanal personalizado**, utilizando a inteligência artificial **Gemini 2.0 Flash** da Google.

---

## 🚀 Funcionalidade

1. **Coleta de dados do atleta:**
   - Nome, idade, altura e peso
   - Nível de atividade (iniciante, intermediário, avançado)
   - Modalidade esportiva
   - Objetivo (ex: emagrecimento, performance)
   - Horas disponíveis por dia da semana

2. **Resumo para confirmação:**
   - Tela de resumo mostra todos os dados preenchidos.
   - O usuário confirma antes de gerar o plano.

3. **Geração do plano:**
   - A IA da Google (via modelo `gemini-2.0-flash`) recebe os dados do usuário.
   - O modelo responde com um plano de treino estruturado, seguindo este padrão:
     - Separado por dias da semana
     - Nome e tipo do treino
     - Duração e intensidade
     - Zona de treino e descrição detalhada
     - Sessões como Warm up, Main Set (com repetições), Cool Down

---

## 🧱 Estrutura do Projeto

```
lib/
├── main.dart
├── models/
│   └── user_data.dart
├── screens/
│   ├── personal_data_screen.dart
│   ├── athletic_data_screen.dart
│   ├── summary_screen.dart
│   └── personalized_training_screen.dart
├── widgets/
│   └── custom_nav_bar.dart
```

---

## 🧠 Tecnologia Utilizada

- **Flutter** (Dart)
- **google_generative_ai** SDK oficial
- **Provider** para gerenciamento de estado
- **Gemini 2.0 Flash** como modelo de linguagem

---

## 🔧 Configuração

### Pré-requisitos
- Flutter SDK instalado
- Conta no [Google AI Studio](https://makersuite.google.com/app) com acesso à Gemini
- Chave de API do Gemini

### Passos:

1. Clone o projeto:
```bash
git clone https://github.com/dom-pedro-II/trainia
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Substitua a sua chave da API Gemini no arquivo `personalized_training_screen.dart`:

```dart
final String apiKey = 'SUA_API_KEY_AQUI';
```

4. Execute o projeto:
```bash
flutter run
```

---

## 📦 Dependências principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  google_generative_ai: ^0.2.2
```

---

## 📌 Observações

- O modelo `gemini-2.0-flash` foi utilizado por ser leve e rápido.
- A resposta da IA segue um **formato padronizado e fácil de ler** com base em blocos de treino como "Warm up", "Repeat X times", "Cool Down", etc.
- Toda a interação com a API do Gemini é feita diretamente na tela `personalized_training_screen.dart`.

---

## 📞 Contato

Caso tenha dúvidas, sugestões ou queira colaborar, entre em contato com o desenvolvedor ou envie um pull request!
