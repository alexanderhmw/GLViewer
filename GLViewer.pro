HEADERS += ./glviewer.h
SOURCES += ./glviewer.cpp

unix{
    INCLUDEPATH += /usr/include/eigen3
}

win32{

}

PROJNAME = GLViewer
INSTTYPE = SDK
include(RobotSDK_Main.pri)
