import 'dart:convert';
import 'package:http/http.dart' as http;

var appkey = '38333295000';
var appsecret = '4cea520a0e2a2ecdc267b75d3424a0ed';

Future<String> getListarClientes({int page}) async {
  Map params = {
    "call": "ListarClientes",
    "app_key": appkey,
    "app_secret": appsecret,
    "param": [
      {"pagina": page, "registros_por_pagina": 30, "apenas_importado_api": "N"}
    ]
  };

  var body = utf8.encode(json.encode(params));
  var response = await http.post(
      Uri.parse("https://app.omie.com.br/api/v1/geral/clientes/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: body);
  print('Code: ${response.statusCode}');
  //print('Body: ${response.body}');
  return response.body;
}

Future<String> getCuponsPagamentos({int page}) async {
  Map params = {
    "call": "CuponsPagamentos",
    "app_key": appkey,
    "app_secret": appsecret,
    "param": [
      {
        "nPagina": page,
        "nRegPorPagina": 30,
      }
    ]
  };

  var body = utf8.encode(json.encode(params));

  var response = await http.post(
      Uri.parse(
          "https://app.omie.com.br/api/v1/produtos/cupomfiscalconsultar/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: body);
  print('Code: ${response.statusCode}');
  return response.body;
}

Future<String> getListarProdutos({int page}) async {
  Map params = {
    "call": "ListarProdutos",
    "app_key": appkey,
    "app_secret": appsecret,
    "param": [
      {
        "pagina": page,
        "registros_por_pagina": 30,
        "apenas_importado_api": "N",
        "filtrar_apenas_omiepdv": "N",
      }
    ]
  };

  var body = utf8.encode(json.encode(params));

  var response = await http.post(
      Uri.parse("https://app.omie.com.br/api/v1/geral/produtos/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: body);
  print('Code: ${response.statusCode}');
  //print('Body: ${response.body}');
  return response.body;
}

Future<String> getListarContasCorrentes() async {
  Map params = {
    "call": "ListarContasCorrentes",
    "app_key": appkey,
    "app_secret": appsecret,
    "param": [
      {
        "pagina": 1,
        "registros_por_pagina": 100,
        "apenas_importado_api": "N",
      }
    ]
  };

  var body = utf8.encode(json.encode(params));

  var response = await http.post(
      Uri.parse("https://app.omie.com.br/api/v1/geral/contacorrente/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: body);
  print('Code: ${response.statusCode}');

  return response.body;
}

Future<String> getListarNCM() async {
  Map params = {
    "call": "ListarNCM",
    "app_key": appkey,
    "app_secret": appsecret,
    "param": [
      {
        "nPagina": 1,
        "nRegPorPagina": 100,
      }
    ]
  };

  var body = utf8.encode(json.encode(params));

  var response =
      await http.post(Uri.parse("https://app.omie.com.br/api/v1/produtos/ncm/"),
          headers: {
            "Content-Type": "application/json",
          },
          body: body);
  print('Code: ${response.statusCode}');

  return response.body;
}
