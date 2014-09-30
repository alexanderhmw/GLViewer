QT += core opengl widgets gui

CONFIG += staticlib qt
TEMPLATE = lib

CONFIG(debug, debug|release){
    TARGET = GLViewer
    DESTDIR = ../Build/lib/Debug
}
else {
    TARGET = GLViewer
    DESTDIR = ../Build/lib/Release
}

DEFINES += QT_DLL QT_OPENGL_LIB GLVIEWER_LIB QT_WIDGETS_LIB

include(GLViewer.pri)

INCLUDEPATH += .

unix{
    INCLUDEPATH += /usr/include/eigen3

    CONFIG(debug, debug|release){
	target.path = $$(HOME)/SDK/$$TARGET/lib/Debug
    }
    else {
	target.path = $$(HOME)/SDK/$$TARGET/lib/Release
    }	
    
    INSTALLS += target

    INSTALL_PREFIX = $$(HOME)/SDK/$$TARGET/include
    INSTALL_HEADERS = $$HEADERS
    include(Install.pri)
}

win32{	
    TMPPATH=$$(RobotDep_Include)
    isEmpty(TMPPATH) {
        error($$TMPPATH is not Specified.)
    }
    else{
        INCLUDEPATH += $$split(TMPPATH,;)
    }
}