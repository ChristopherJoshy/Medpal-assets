import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'viewprofile_model.dart';
export 'viewprofile_model.dart';

class ViewprofileWidget extends StatefulWidget {
  const ViewprofileWidget({super.key});

  @override
  State<ViewprofileWidget> createState() => _ViewprofileWidgetState();
}

class _ViewprofileWidgetState extends State<ViewprofileWidget> {
  late ViewprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewprofileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF4B0082),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent1,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentUserDisplayName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ),
              Text(
                currentUserEmail,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      fontSize: 9.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: const AlignmentDirectional(-0.2, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 27.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Settings');
                  },
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRing(
                                  color: Color(0xFFEFEEFA),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> imageUsersRecordList =
                              snapshot.data!;
                          final imageUsersRecord =
                              imageUsersRecordList.isNotEmpty
                                  ? imageUsersRecordList.first
                                  : null;

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              imageUsersRecord!.userbg,
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.25,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.05, 1.22),
                      child: Container(
                        width: 188.0,
                        height: 188.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 3.0,
                          ),
                        ),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 150.0,
                            height: 150.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 463.0,
              height: 499.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.8, 0.1),
                      child: StreamBuilder<List<TaskRecord>>(
                        stream: queryTaskRecord(
                          queryBuilder: (taskRecord) => taskRecord
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'completed',
                                isEqualTo: true,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRing(
                                  color: Color(0xFFEFEEFA),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<TaskRecord> totalcomptaTaskRecordList =
                              snapshot.data!;

                          return Text(
                            totalcomptaTaskRecordList.length.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9, -3.4),
                      child: Text(
                        'Total Tasks Completed :-',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 19.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w900,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9, -4.8),
                      child: Text(
                        'Account Created Date:-',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w900,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9, -6.2),
                      child: Text(
                        'Account Level:-',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w900,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.9, -6.2),
                      child: Text(
                        'Account Experence:-',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w900,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.6, -12.9),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                                "yMMMd", currentUserDocument?.createdTime),
                            'dd/mm/yy',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.3, -14.2),
                      child: StreamBuilder<List<TaskRecord>>(
                        stream: queryTaskRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRing(
                                  color: Color(0xFFEFEEFA),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<TaskRecord> textTaskRecordList = snapshot.data!;
                          final textTaskRecord = textTaskRecordList.isNotEmpty
                              ? textTaskRecordList.first
                              : null;

                          return Text(
                            valueOrDefault<String>(
                              textTaskRecord?.level.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.3, -14.0),
                      child: StreamBuilder<List<TaskRecord>>(
                        stream: queryTaskRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRing(
                                  color: Color(0xFFEFEEFA),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<TaskRecord> textTaskRecordList = snapshot.data!;
                          final textTaskRecord = textTaskRecordList.isNotEmpty
                              ? textTaskRecordList.first
                              : null;

                          return Text(
                            textTaskRecord!.xp.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
