class Cliente {
  String nome;

  Cliente(
    this.nome,
  );

  factory Cliente.fromJson(dynamic json) {
    return Cliente(
      json['razao_social'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.nome}}';
  }
}

class ListarClientes {
  int pagina;
  int registros;
  int total;
  List<Cliente> cliente;

  ListarClientes(this.pagina, this.registros, this.total, [this.cliente]);

  factory ListarClientes.fromJson(dynamic json) {
    var clienteObjsJson = json['clientes_cadastro'] as List;
    List<Cliente> _cliente = clienteObjsJson
        .map((clienteJson) => Cliente.fromJson(clienteJson))
        .toList();

    return ListarClientes(
        json['pagina'], json['registros'], json['total_de_paginas'], _cliente);
  }

  @override
  String toString() {
    return '{ ${this.pagina}, ${this.registros}, ${this.total}, ${this.cliente} }';
  }
}

class Pagamentos {
  String nome;
  String emissao;
  String forma;
  int numeracaonfce;

  Pagamentos(
    this.nome,
    this.emissao,
    this.forma,
    this.numeracaonfce,
  );

  factory Pagamentos.fromJson(dynamic json) {
    return Pagamentos(
      json['cRazaoSocialCliente'] as String,
      json['dDtEmissaoCupom'] as String,
      json['xContaCorrente'] as String,
      json['nNumCupom'],
    );
  }

  @override
  String toString() {
    return '{ ${this.nome}, ${this.emissao}, ${this.numeracaonfce}}';
  }
}

class CuponsPagamentos {
  int pagina;
  int registros;
  int total;
  List<Pagamentos> pagamentos;

  CuponsPagamentos(this.pagina, this.registros, this.total, [this.pagamentos]);

  factory CuponsPagamentos.fromJson(dynamic json) {
    var pagamentoObjsJson = json['pagamentos'] as List;
    List<Pagamentos> _pagamento = pagamentoObjsJson
        .map((pagamentoObjsJson) => Pagamentos.fromJson(pagamentoObjsJson))
        .toList();

    return CuponsPagamentos(
        json['nPagina'], json['nRegistros'], json['nTotPaginas'], _pagamento);
  }

  @override
  String toString() {
    return '{ ${this.pagina}, ${this.registros}, ${this.total}, ${this.pagamentos} }';
  }
}

class Produto {
  String descricao;
  String unidade;
  String valor;

  Produto(
    this.descricao,
    this.unidade,
    this.valor,
  );

  factory Produto.fromJson(dynamic json) {
    return Produto(
      json['descricao'] as String,
      json['unidade'] as String,
      json['valor_unitario'].toString(),
    );
  }

  @override
  String toString() {
    return '{ ${this.descricao}, ${this.unidade}, ${this.valor}}';
  }
}

class ListarProdutos {
  int pagina;
  int registros;
  int total;
  List<Produto> produto;

  ListarProdutos(this.pagina, this.registros, this.total, [this.produto]);

  factory ListarProdutos.fromJson(dynamic json) {
    var produtoObjsJson = json['produto_servico_cadastro'] as List;
    List<Produto> _produto = produtoObjsJson
        .map((produtoObjsJson) => Produto.fromJson(produtoObjsJson))
        .toList();

    return ListarProdutos(
      json['pagina'],
      json['registros_por_pagina'],
      json['total_de_paginas'],
      _produto,
    );
  }

  @override
  String toString() {
    return '{ ${this.pagina}, ${this.registros}, ${this.produto} }';
  }
}

class Conta {
  String descricao;
  String tipo;

  Conta(
    this.descricao,
    this.tipo,
  );

  factory Conta.fromJson(dynamic json) {
    return Conta(
      json['descricao'] as String,
      json['tipo'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.descricao}, ${this.tipo}}';
  }
}

class ListarContas {
  int pagina;
  int registros;
  List<Conta> conta;

  ListarContas(this.pagina, this.registros, [this.conta]);

  factory ListarContas.fromJson(dynamic json) {
    var contaObjsJson = json['ListarContasCorrentes'] as List;
    List<Conta> _conta = contaObjsJson
        .map((contaObjsJson) => Conta.fromJson(contaObjsJson))
        .toList();

    return ListarContas(json['pagina'], json['registros'], _conta);
  }

  @override
  String toString() {
    return '{ ${this.pagina}, ${this.registros}, ${this.conta} }';
  }
}

class NCM {
  String codigo;
  String descricao;

  NCM(
    this.codigo,
    this.descricao,
  );

  factory NCM.fromJson(dynamic json) {
    return NCM(
      json['cCodigo'] as String,
      json['cDescricao'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.codigo}, ${this.descricao}}';
  }
}

class ListarNCM {
  int pagina;
  int registros;
  List<NCM> ncm;

  ListarNCM(this.pagina, this.registros, [this.ncm]);

  factory ListarNCM.fromJson(dynamic json) {
    var ncmObjsJson = json['listaNCM'] as List;
    List<NCM> _ncm =
        ncmObjsJson.map((ncmObjsJson) => NCM.fromJson(ncmObjsJson)).toList();

    return ListarNCM(json['nPagina'], json['nRegistros'], _ncm);
  }

  @override
  String toString() {
    return '{ ${this.pagina}, ${this.registros}, ${this.ncm} }';
  }
}
