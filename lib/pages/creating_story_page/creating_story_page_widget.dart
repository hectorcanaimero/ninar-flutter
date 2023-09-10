import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'creating_story_page_model.dart';
export 'creating_story_page_model.dart';

class CreatingStoryPageWidget extends StatefulWidget {
  const CreatingStoryPageWidget({
    Key? key,
    required this.character,
    required this.age,
    required this.theme,
  }) : super(key: key);

  final String? character;
  final String? age;
  final String? theme;

  @override
  _CreatingStoryPageWidgetState createState() =>
      _CreatingStoryPageWidgetState();
}

class _CreatingStoryPageWidgetState extends State<CreatingStoryPageWidget>
    with TickerProviderStateMixin {
  late CreatingStoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 5000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatingStoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreatingStoryPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATING_STORY_CreatingStoryPage_ON_INIT');
      logFirebaseEvent('CreatingStoryPage_backend_call');
      _model.apiResult0yi = await OpenAIGroup.storyGenerationCall.call(
        theme: widget.theme,
        language: FFLocalizations.of(context).languageCode,
        age: widget.age,
        character: widget.character,
      );
      if ((_model.apiResult0yi?.succeeded ?? true)) {
        logFirebaseEvent('CreatingStoryPage_backend_call');
        _model.apiResultukh = await OpenAIGroup.imageGenerationCall.call(
          prompt:
              'Generate a cover for a children\'s story about${widget.theme}',
        );
        if ((_model.apiResultukh?.succeeded ?? true)) {
          logFirebaseEvent('CreatingStoryPage_backend_call');

          await StoriesRecord.collection.doc().set({
            ...createStoriesRecordData(
              user: currentUserReference,
              character: widget.character,
              theme: widget.theme,
              age: widget.age,
              language: FFLocalizations.of(context).languageCode,
              image: OpenAIGroup.imageGenerationCall.urlImage(
                (_model.apiResultukh?.jsonBody ?? ''),
              ),
              title: functions.parseStory(
                  OpenAIGroup.storyGenerationCall
                      .content(
                        (_model.apiResult0yi?.jsonBody ?? ''),
                      )
                      .toString()
                      .toString(),
                  1),
              content: functions.parseStory(
                  OpenAIGroup.storyGenerationCall
                      .content(
                        (_model.apiResult0yi?.jsonBody ?? ''),
                      )
                      .toString()
                      .toString(),
                  2),
            ),
            'timestamp': FieldValue.serverTimestamp(),
          });
          logFirebaseEvent('CreatingStoryPage_navigate_to');

          context.pushNamed(
            'ViewStoryPage',
            queryParameters: {
              'image': serializeParam(
                OpenAIGroup.imageGenerationCall.urlImage(
                  (_model.apiResultukh?.jsonBody ?? ''),
                ),
                ParamType.String,
              ),
              'content': serializeParam(
                OpenAIGroup.storyGenerationCall
                    .content(
                      (_model.apiResult0yi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Icon(
                        Icons.settings_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 56.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'dqvnmjez' /* We are generating your story */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowAdBanner(
                  width: double.infinity,
                  height: double.infinity,
                  showsTestAd: true,
                  androidAdUnitID: 'ca-app-pub-1769333170353019/5418958657',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
