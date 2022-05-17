import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  List listaValoresLogicos = [];
  List listaTransformada = [];

  void limpar() {
    setState(() {
      textEditingController.clear();
    });
  }

  void apagarUltimo() {
    setState(() {
      String texto = "";
      for (int i = 0; i < textEditingController.text.length - 1; i++) {
        texto = texto + textEditingController.text[i];
      }
      textEditingController.text = texto;
    });
  }

  void escreverV() {
    setState(() {
      textEditingController.text = textEditingController.text + 'V';
    });
  }

  void escreverF() {
    setState(() {
      textEditingController.text = textEditingController.text + 'F';
    });
  }

  void escreverP() {
    setState(() {
      textEditingController.text = textEditingController.text + 'P';
    });
  }

  void escreverQ() {
    setState(() {
      textEditingController.text = textEditingController.text + 'Q';
    });
  }

  void escreverR() {
    setState(() {
      textEditingController.text = textEditingController.text + 'R';
    });
  }

  void escreverS() {
    setState(() {
      textEditingController.text = textEditingController.text + 'S';
    });
  }

  void escreverNao() {
    setState(() {
      textEditingController.text = textEditingController.text + '~';
    });
  }

  void escreverE() {
    setState(() {
      textEditingController.text = textEditingController.text + '^';
    });
  }

  void escreverOU() {
    setState(() {
      textEditingController.text = textEditingController.text + 'v';
    });
  }

  void escreverSeEntao() {
    setState(() {
      textEditingController.text = textEditingController.text + '>';
    });
  }

  void escreverSeESomenteSe() {
    setState(() {
      textEditingController.text = textEditingController.text + '§';
    });
  }

  void escreverAbreParentese() {
    setState(() {
      textEditingController.text = textEditingController.text + '(';
    });
  }

  void escreverFechaParentese() {
    setState(() {
      textEditingController.text = textEditingController.text + ')';
    });
  }

  String removerPrimeiro(String s) {
    String resultado = '';
    for (int i = 1; i < s.length; i++) {
      resultado = resultado + s[i];
    }
    return resultado;
  }

  String removerUltimo(String s) {
    String resultado = '';
    for (int i = 0; i < s.length - 1; i++) {
      resultado = resultado + s[i];
    }
    return resultado;
  }

  //vvvvvvv importante vvvvvvvv
  String gerarParentese(String s) {
    String parenteses = '';
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(' || s[i] == ')') {
        parenteses += s[i];
      }
    }
    return parenteses;
  }

  String removerCaractereNaPosisao(String s, int posicao) {
    String resultante = '';
    for (int i = 0; i < s.length; i++) {
      if (i != posicao) {
        resultante += s[i];
      }
    }
    return resultante;
  }

  int contarConectivos(String s){
    int contador = 0;

    for(int i=0; i<s.length; i++){
      if(s[i] == 'v' || s[i] == '^' || s[i] == '>' || s[i] == '§'){
        contador++;
      }
    }

    return contador;
  }

  int contarCaractere(String s, String c) {
    int contador = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == c) {
        contador++;
      }
    }
    return contador;
  }

  bool validarParentese(String s) {
    String parenteses = gerarParentese(s);
    if ((parenteses.length.isOdd)) {
      return false;
    }
    if (parenteses[0] == ')' || parenteses[parenteses.length - 1] == '(') {
      return false;
    }
    for (int i = 0; i < parenteses.length - 2; i++) {
      if (parenteses[i] != parenteses[i + 1]) {
        parenteses = removerCaractereNaPosisao(parenteses, i);
        parenteses = removerCaractereNaPosisao(parenteses, i);
        break;
      }
    }
    for (int i = 0; i < s.length - 1; i++) {
      if (s[i] == ')' && s[i + 1] == '(') {
        return false;
      }
      if (s[i] == '(' && s[i + 1] == ')') {
        return false;
      }
    }
    if (contarCaractere(parenteses, '(') != contarCaractere(parenteses, ')')){
      return false;
    }
      
    return true;
  }

  String normalizar(String s){
    String normalizada = '';
    return normalizada;
  }

  bool validarProposicaoEconectivo(String s) {
    for (int i = 0; i < s.length - 1; i++) {
      switch (s[i]) {
        case 'V':
          if (s[i + 1] == 'V' || s[i+1] == 'F'){
            return false;
          }
          break;

        case 'F':
          if (s[i + 1] == 'V' || s[i+1] == 'F'){
            return false;
          }
          break;

        case 'P':
          if (s[i + 1] == 'P' ||
              s[i + 1] == 'Q' ||
              s[i + 1] == 'R' ||
              s[i + 1] == 'S') {
            return false;
          }
          break;

        case 'Q':
          if (s[i + 1] == 'P' ||
              s[i + 1] == 'Q' ||
              s[i + 1] == 'R' ||
              s[i + 1] == 'S') {
            return false;
          }
          break;

        case 'R':
          if (s[i + 1] == 'P' ||
              s[i + 1] == 'Q' ||
              s[i + 1] == 'R' ||
              s[i + 1] == 'S') {
            return false;
          }
          break;

        case 'S':
          if (s[i + 1] == 'P' ||
              s[i + 1] == 'Q' ||
              s[i + 1] == 'R' ||
              s[i + 1] == 'S') {
            return false;
          }
          break;

        case '^':
          if (s[i + 1] == '^' ||
              s[i + 1] == 'v' ||
              s[i + 1] == '>' ||
              s[i + 1] == '§') {
            return false;
          }
          break;

        case 'v':
          if (s[i + 1] == '^' ||
              s[i + 1] == 'v' ||
              s[i + 1] == '>' ||
              s[i + 1] == '§') {
            return false;
          }
          break;

        case '>':
          if (s[i + 1] == '^' ||
              s[i + 1] == 'v' ||
              s[i + 1] == '>' ||
              s[i + 1] == '§') {
            return false;
          }
          break;

        case '§':
          if (s[i + 1] == '^' ||
              s[i + 1] == 'v' ||
              s[i + 1] == '>' ||
              s[i + 1] == '§') {
            return false;
          }
      }
    }
    if (s[s.length - 1] == '^' ||
        s[s.length - 1] == 'v' ||
        s[s.length - 1] == '>' ||
        s[s.length - 1] == '§' ||
        s[s.length - 1] == '~') return false;
    return true;
  }

  bool validarTudo(String s) {
    if (gerarParentese(s).isNotEmpty) {
      return validarParentese(s) && validarProposicaoEconectivo(s);
    }
    return validarProposicaoEconectivo(s);
  }

  bool calcularProposisao(String p){
    if(p == 'V'){return true;}
    return false;
  }

  bool calcularValorLogico(bool p, String conectivo, bool q){
    if (conectivo == 'v') {
      return (p || q);
    } else if (conectivo == '>') {
      return (!p || q);
    } else if (conectivo == '§') {
      return ((!p || q) && (!q || p));
    }
    return p && q;
  }

  bool reduzirNegacao(String s) {
    bool controle = true;
    for (int i = 0; i < s.length - 3; i++) {
      if (s[i] == '~') {
        controle != controle;
      } else {
        break;
      }
    }
    return controle;
  }

  int contarProposicoes(String s) {
    String p = '';
    for (int i = 0; i < s.length - 1; i++) {
      if (s[i] == 'P' || s[i] == 'Q' || s[i] == 'R' || s[i] == 'S') {
        if (!(p.contains(s[i]))) {
          p += s[i];
        }
      }
    }
    return p.length;
  }

String eliminarRestoParenteses(String s) {
    String expressao = s;
    
    if(expressao[0] == '(' && expressao[1] != '('){
      expressao = removerCaractereNaPosisao(expressao, 0);
      return expressao;
    }
  
    while(expressao[0] == '('){
      expressao = removerCaractereNaPosisao(expressao,0);
    }
  
    for(int i=0; i<expressao.length-1;i++){
      if(expressao[i] == '(' && expressao[i+1] == ')'){
        expressao = removerCaractereNaPosisao(expressao, i);
        expressao = removerCaractereNaPosisao(expressao, i);
        return expressao;
      }else if(expressao[i] == ')'){
        expressao = removerCaractereNaPosisao(expressao,i);
      }
    }
    
    return expressao;
  }

String arrumarProposicao(String aux){
  String resultado = '';
  for(int i=0; i<aux.length-1; i++){
    if(aux[i] != aux[i+1]){
      resultado += aux[i];
    }
  }
  return resultado;
}

String getEntreParentese(String s){
  String expressao = '';
  if(!s.contains(')')){
    return s;
  }
  
  for(int i=0; i<s.length-2; i++){
    if(s[i] == '('){
      for(int j=i+1; j<s.length-1; j++){
        if(s[j] == '('){
          expressao = '';
          break;
        }else if(s[j] == ')'){
          return expressao;
        }else{
          expressao += s[j];
        }
      }
      
    }
  }
  
  return expressao;
}

String removerEntreIntervalo(String s, int daqui, int ate){
  String resultado = s;
  while(daqui!=ate){
    resultado = removerCaractereNaPosisao(resultado,daqui);
    ate--;
  }
  return resultado;
}

String removerEntreParentese(String s){
  if(!s.contains('(')){
    return s;
  }
  
  String resultado = '';
  
  int deTanto = 0;
  int aTanto = 0;
  bool fechou = false;
  
  if(s[0] != '('){
    for(int i=0; i<s.length-1; i++){
      if(s[i] != '('){
        resultado += s[i];
      }else{
        break;
      }
    }
  }else{
    for(int i=0; i<s.length-2; i++){
    if(s[i] == '('){
      for(int j=i+1; j<s.length-1; j++){
        if(s[j] == '('){
          deTanto = i;
          break;
        }else if(s[j] == ')'){
          aTanto = j;
          fechou = true;
          break;
        }
      }
    }
    if(fechou){
      break;
    }
  }
  if(fechou){
    for(int i=0; i<s.length;i++){
    if((i <= deTanto || i >aTanto)){
      resultado += s[i];
      }
    }
  }  
 }
  
  return resultado;
}

List<String> separador(String s){
  List<String> expressao = [];
  
  String expressaoAtual = s;
  
  while(expressaoAtual.isNotEmpty){
    
    String expressaoAuxiliar = getEntreParentese(expressaoAtual);
    expressaoAuxiliar = eliminarRestoParenteses(expressaoAuxiliar);
    
    expressao.add(expressaoAuxiliar);
    
    expressaoAtual = removerEntreParentese(expressaoAtual);
    
  }
  return expressao;
}

List<String> getConectivosSobrando(String s){
  List<String> conectivos = [];
  
  for(int i=0; i<s.length-1; i++){
    if((s[i] == '>' || s[i] == 'v' || s[i] == '§' || s[i] == '>' || s[i] == '^') && s[i+1] == '('){
      conectivos.add(s[i]);
    }
  }
  
  return conectivos;
}

String deixarEmPontoDeBala(String expressao){
  
  List<String> expressoesEmPontoDeBala = separador(expressao);
  List<String> conectivosEmPontoBala = getConectivosSobrando(expressao);
  
  List<bool> solucoes = [];
  
  for(int i=0; i<expressoesEmPontoDeBala.length;i++){
    String p = expressoesEmPontoDeBala[i];
      
    if(!(p.contains('>') || p.contains('v') || p.contains('>') || p.contains('§'))){
      solucoes.add(calcularProposisao(p[0]));
    }else{
      solucoes.add(calcularValorLogico(calcularProposisao(p[0]),p[1],calcularProposisao(p[2])));  
    }
    
  }
  
  String expressaoEmPontoDeBala = '';
  
  while(solucoes.isNotEmpty){
    if(solucoes[0]){
       expressaoEmPontoDeBala += 'V';
    }else{
       expressaoEmPontoDeBala += 'F';
    }
    
    if(conectivosEmPontoBala.isNotEmpty){
      expressaoEmPontoDeBala += conectivosEmPontoBala[0];
      conectivosEmPontoBala.removeAt(0);
    }
    
    solucoes.removeAt(0);
  }
    
  return expressaoEmPontoDeBala;
}

bool mandarBala(String s){
  bool bala = calcularProposisao(s[0]);
  String expressao = s;
  
  expressao = removerCaractereNaPosisao(expressao,0);
  
  while(expressao.isNotEmpty){
    bala = calcularValorLogico(bala, expressao[0],calcularProposisao(expressao[1]));
    expressao = removerCaractereNaPosisao(expressao,0);
    expressao = removerCaractereNaPosisao(expressao,0);
  }
  
  return bala;
}
  //^^^^^^^^^^ importante ^^^^^^^^^^

  void analisar() {
    setState(() {
      if (!validarTudo(textEditingController.text)) {
        showAlertDialogErro(context, 'Formula mal formulada');
      } else {
        showAlertDialog(context, textEditingController.text);
      }
    });
  }

  void showAlertDialogErro(BuildContext context, String retorno) {
    Widget ok = ElevatedButton(
        onPressed: () => {Navigator.of(context).pop()},
        child: const Text('OK'),
        style: ElevatedButton.styleFrom(primary: Colors.red));
    AlertDialog alertDialog = AlertDialog(
        title: Text(
          retorno,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(alignment: Alignment.center, child: ok),
              )
            ],
          )
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void showAlertDialog(BuildContext context, String retorno) {
    String expressao = textEditingController.text;
    String resultadoEmString = '';
    if(mandarBala(expressao)){
      resultadoEmString = 'VERDADEIRO';
    }else{
      resultadoEmString = 'FALSO';
    }

    Widget pronto = ElevatedButton(
        onPressed: () => {Navigator.of(context).pop()},
        child: const Text('Pronto'),
        style: ElevatedButton.styleFrom(primary: Colors.green));
    AlertDialog alertDialog = AlertDialog(
        title: Text(retorno),
        actionsAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Resultado: '),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Text(resultadoEmString),
                ]),
              ),
              pronto,
            ],
          )
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Analisador Lógico'),
        actions: [
          IconButton(onPressed: limpar, icon: const Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: TextFormField(
                controller: textEditingController,
                readOnly: true,
                decoration: const InputDecoration(
                    label: Text('Escreva a expressão lógica'),
                    border: OutlineInputBorder())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  child: const Text('V'),
                  onPressed: escreverV,
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  child: const Text('F'),
                  onPressed: escreverF,
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('^'),
                onPressed: escreverE,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                child: const Text('v'),
                onPressed: escreverOU,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                child: const Text('>'),
                onPressed: escreverSeEntao,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                child: const Text('<->'),
                onPressed: escreverSeESomenteSe,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('~'),
                onPressed: escreverNao,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                child: const Text('('),
                onPressed: escreverAbreParentese,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                child: const Text(')'),
                onPressed: escreverFechaParentese,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                child: const Text('apagar'),
                onPressed: apagarUltimo,
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
        child: const Text('Analisar'),
        onPressed: () => {analisar()},
        style: ElevatedButton.styleFrom(primary: Colors.black),
      )),
    );
  }
}
