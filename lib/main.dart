import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Home()));
}


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController = TextEditingController();
  List listaValoresLogicos = [];
  List listaTransformada = [];

  void limpar(){
    setState(() {
      textEditingController.clear();
    });
  }

  void apagarUltimo(){
    setState(() {
      String texto = "";
        for(int i = 0; i < textEditingController.text.length-1;i++){
          texto = texto + textEditingController.text[i];
        }
      textEditingController.text = texto;

    });
  }

  void escreverP(){
    setState(() {
      textEditingController.text = textEditingController.text + 'P';
    });
  }

  void escreverQ(){
    setState(() {
      textEditingController.text = textEditingController.text + 'Q';
    });
  }

  void escreverR(){
    setState(() {
      textEditingController.text = textEditingController.text + 'R';
    });
  }

  void escreverS(){
    setState(() {
      textEditingController.text = textEditingController.text + 'S';
    });
  }

  void escreverNao(){
    setState(() {
      textEditingController.text = textEditingController.text + '~';
    });
  }

  void escreverE(){
    setState(() {
      textEditingController.text = textEditingController.text + '^';
    });
  }

  void escreverOU(){
    setState(() {
      textEditingController.text = textEditingController.text + 'v';
    });
  }

  void escreverSeEntao(){
    setState(() {
      textEditingController.text = textEditingController.text + '>';
    });
  }

  void escreverSeESomenteSe(){
    setState(() {
      textEditingController.text = textEditingController.text + '§';
    });
  }

  void escreverAbreParentese(){
    setState(() {
      textEditingController.text = textEditingController.text + '(';
    });
  }

  void escreverFechaParentese(){
    setState(() {
      textEditingController.text = textEditingController.text + ')';
    });
  }
  //vvvvvvv importante vvvvvvvv
  bool validarParentese(String s){
    bool abriu = false;
    bool fechou = false;
    for(int i=0; i<s.length; i++){
      if(s[i] == '('){
        abriu = !abriu;
      }else if(s[i] == ')'){
        fechou = !fechou;
      }
    }
    return abriu == fechou;
  }

  bool validarPropoEconectivo(String s){
    for(int i=0; i<s.length-1; i++){
      if(s[i] == s[i+1]){
        return false;
      }
    }
    return true;
  }

  bool validarTudo(String s){
    return validarParentese(s) && validarPropoEconectivo(s);
  }


  bool calcularValorLogico(bool p, String conectivo, bool q){

    if(conectivo == 'v'){
      return p || q;
    }else if(conectivo == '>'){
      return !p || q;

    }else if(conectivo == '§'){
      return ((!p || q) && (!q || p));
    }
    return p && q;
  }

  bool negar(bool valorProposisao){
    return !valorProposisao;
  }
  //^^^^^^^^^ importante ^^^^^^^^

  void analisar(){
    setState(() {
     
    });
  }

  void showAlertDialogErro(BuildContext context, String retorno){
  Widget ok = ElevatedButton(onPressed: () => {Navigator.of(context).pop()}, child: const Text('OK'), style: ElevatedButton.styleFrom(primary: Colors.red));
  AlertDialog alertDialog = AlertDialog(
    title: Text(retorno),
    alignment: Alignment.center,
    actions: <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Padding(padding: const EdgeInsets.all(30),child: Container(alignment: Alignment.center, child: ok),)
      ],
    )]
  );
  showDialog(context: context, builder: (BuildContext context){return alertDialog;});
}

  void showAlertDialog(BuildContext context, String retorno){
  Widget pronto = ElevatedButton(onPressed: () => {Navigator.of(context).pop()}, child: const Text('Pronto'), style: ElevatedButton.styleFrom(primary: Colors.green));
  AlertDialog alertDialog = AlertDialog(
    title: Text(retorno),
    alignment: Alignment.center,
    actions: <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Row(
          children: [
            const Text('|P| '),
            const Text(' |Q|'),
            Text("  |"+textEditingController.text+"| ")
          ],
        ),
        pronto,

      ],
    )]
  );
  showDialog(context: context, builder: (BuildContext context){return alertDialog;});
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
                decoration: const InputDecoration(label: Text('Escreva a expressão lógica'),border: OutlineInputBorder())),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(padding: const EdgeInsets.only(top:100),
                    child: 
                      ElevatedButton(
                        child: const Text('P'),
                        onPressed: escreverP,
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                      ),
                  ),

                  Padding(padding: const EdgeInsets.only(top:100),
                    child: 
                      ElevatedButton(
                        child: const Text('Q'),
                        onPressed: escreverQ,
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                      ),
                  ),

                  Padding(padding: const EdgeInsets.only(top:100),
                    child: 
                      ElevatedButton(
                        child: const Text('R'),
                        onPressed: escreverR,
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                      ),
                  ),

                  Padding(padding: const EdgeInsets.only(top:100),
                    child: 
                      ElevatedButton(
                        child: const Text('S'),
                        onPressed: escreverS,
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
        )
      ),
      bottomNavigationBar: BottomAppBar(child: ElevatedButton(child: const Text('Analisar'),onPressed: () => {analisar()},style: ElevatedButton.styleFrom(primary: Colors.black),)),
    );
  }
}