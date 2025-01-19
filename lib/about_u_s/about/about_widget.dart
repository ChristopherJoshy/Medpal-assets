import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_model.dart';
export 'about_model.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  late AboutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).alternate,
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
          title: Text(
            'About Us',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      GoogleFonts.asMap().containsKey('Roboto Condensed'),
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 8.0),
              child: AuthUserStreamWidget(
                builder: (context) => Container(
                  width: 200.0,
                  height: 200.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    currentUserPhoto,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
          width: 100.0,
          height: 100.0,
          constraints: BoxConstraints(
            minWidth: MediaQuery.sizeOf(context).width * 1.0,
            minHeight: MediaQuery.sizeOf(context).height * 1.0,
          ),
          decoration: const BoxDecoration(
            color: Color(0xE68B40D0),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, -0.8),
            child: Text(
              'MED-PAL is a recovery-focused app supporting individuals. App aims for people in their post-retention, it helps them to maintain the lifestyle they follow on their rehabilitation period.\n It offers medication management, motivational tools, task tracking, peer support, and fitness recommendations. Features like leaderboards and community challenges keep users engaged. ',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto Slab',
                    color: const Color(0xFFD6D4D4),
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Roboto Slab'),
                    lineHeight: 2.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
