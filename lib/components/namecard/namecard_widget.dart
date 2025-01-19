import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'namecard_model.dart';
export 'namecard_model.dart';

class NamecardWidget extends StatefulWidget {
  const NamecardWidget({super.key});

  @override
  State<NamecardWidget> createState() => _NamecardWidgetState();
}

class _NamecardWidgetState extends State<NamecardWidget> {
  late NamecardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NamecardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410.0,
      height: 199.0,
      decoration: const BoxDecoration(
        color: Color(0xC37C43AB),
      ),
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
          List<UsersRecord> stackUsersRecordList = snapshot.data!;
          final stackUsersRecord = stackUsersRecordList.isNotEmpty
              ? stackUsersRecordList.first
              : null;

          return Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        currentUserPhoto,
                        width: 86.0,
                        height: 75.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.04, -0.59),
                child: CircularPercentIndicator(
                  percent: 0.5,
                  radius: 50.0,
                  lineWidth: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: const Color(0xFFCE1717),
                  backgroundColor: const Color(0xFFEE686A),
                  center: Text(
                    'Health',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.86, -0.61),
                child: CircularPercentIndicator(
                  percent: 0.5,
                  radius: 50.0,
                  lineWidth: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: const Color(0xFFD5E507),
                  backgroundColor: const Color(0xFFB0B053),
                  center: Text(
                    'Experience',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.33, 0.73),
                child: AuthUserStreamWidget(
                  builder: (context) => Text(
                    valueOrDefault<String>(
                      dateTimeFormat("yMMMd", currentUserDocument?.createdTime),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.74, 0.72),
                child: Text(
                  'Joined:-',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.78, -0.02),
                child: Text(
                  '',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.96, -0.02),
                child: Text(
                  'Lv:- ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
