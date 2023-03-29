import 'dart:io';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/repositories/repositories.dart';
import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/services/mailer_service.dart';
import 'package:escuela_backend/repositories/link_repository.dart';

import '../utility/mailer/mail.dart';

class LinkService {
  final _templates = Templates();
  final _mailerService = MailerService();
  final _alumnosRepository = AlumnoRepository();
  final _asignaturaRepository = AsignaturaRepository();
  final _cursoRepository = CursoRepository();
  final _linkRepository = LinkRepository();

  Future<Map> sendAlumnosByAsignatura(String token) async {
    final jwtVerify = JWT.verify(token, SecretKey(dotEnv['JWT_TOKEN']!));
    if (jwtVerify == false) {
      throw Exception('Token invalido');
    }
    final jwt = JWT.decode(token);

    final cursoByAsignatura =
        await _cursoRepository.getCursoByAsignatura(jwt.payload['asignatura']);

    final listaAlumnos =
        await _alumnosRepository.getAlumnosBash(cursoByAsignatura['alumnos']);

    return {
      'idCurso': cursoByAsignatura['idCurso'],
      'idDocente': jwt.payload['docente'],
      'idAsignatura': jwt.payload['asignatura'],
      'alumnos': listaAlumnos,
      "alumnosCount": listaAlumnos.length
    };
  }

  final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

  //esta funcion crea un enlace de pedido de calificaciones por asignatura
  //recibe un Id de asignatura
  Future<Map<String, String>> sendLinkCalificacion(
      {required String idAsignatura, required String periodo}) async {
    final asignatura =
        await _asignaturaRepository.getAsignaturaById(idAsignatura);

    final checkActivesLink =
        await _linkRepository.getLinkByDocenteAndPeriodoAndAsignatura(
            idDocente: asignatura['docente']['idDocente'],
            periodo: periodo,
            idAsignatura: asignatura['idAsignatura']);

    if (checkActivesLink.isNotEmpty) {
      throw Exception('Ya existe un link activo');
    }
    final jwt = JWT({
      "docente": asignatura['docente']['idDocente'],
      "asignatura": asignatura['idAsignatura'],
      "periodo": periodo,
      "exp": DateTime.now().add(Duration(days: 2)).millisecondsSinceEpoch
    });

    final token = jwt.sign(SecretKey(dotEnv['JWT_TOKEN']!));
    await _linkRepository.createLinkRegister(
        token: token,
        periodo: periodo,
        idAsignatura: asignatura['idAsignatura'],
        idDocente: asignatura['docente']['idDocente']);

    final html = _templates.pedidoCalificaciones(
        nombre: asignatura['docente']['nombre'],
        apellido: asignatura['docente']['apellido'],
        link: 'https://escuelas-production.up.railway.app/api/link/$token');
    if (html == null) {
      throw Exception('No se pudo generar el html');
    }
    sendMailerFunction(
        mailDestinatario: asignatura['docente']['email'],
        subject: 'pedido de calificaciones',
        mailHtml: html);

    return {'status': 'ok'};
  }

  Future<Map> updatLinkRegister(String token,
      [bool? notasCargadas, bool? emailEnviado, bool? active]) async {
    final registroOriginal = await _linkRepository.getLinkByToken(token);

    final registro = {
      'notasCargadas': notasCargadas ?? registroOriginal['notasCargadas'],
      'emailEnviado': emailEnviado ?? registroOriginal['emailEnviado'],
      'active': active ?? registroOriginal['active'],
    };
    await _linkRepository.updateLinkRegister(
        registro: registro, idEnlace: registroOriginal['idEnlace']);
    return {'status': 'ok'};
  }

  Future<Map> getLinkByToken(String token) async {
    final registro = await _linkRepository.getLinkByToken(token);
    return registro;
  }

  Future<List> getLinksByPeriodo(String periodo) async {
    final registros = await _linkRepository.getLinksByPeriodo(periodo);
    return registros;
  }
}
