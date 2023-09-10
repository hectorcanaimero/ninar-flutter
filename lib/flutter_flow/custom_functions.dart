import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String parseStory(
  String content,
  int type,
) {
  Map<String, dynamic> storyMap = json.decode(content);
  if (type == 1) {
    return storyMap['title'] ?? 'Título no encontrado';
  } else if (type == 2) {
    return storyMap['body'] ?? 'Cuerpo no encontrado';
  } else {
    return 'Tipo no válido';
  }
}
