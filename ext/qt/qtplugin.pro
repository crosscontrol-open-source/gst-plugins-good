TEMPLATE = lib

TARGET = gstqmlgl

QT += qml quick gui

QT_CONFIG -= no-pkg-config
CONFIG += link_pkgconfig debug
PKGCONFIG = \
    gstreamer-1.0 \
    gstreamer-video-1.0 \
    gstreamer-gl-1.0

android {
    CONFIG += static
} else {
    CONFIG += plugin
}

android:DEFINES += HAVE_QT_ANDROID
win32:DEFINES += HAVE_QT_WIN32
macx:DEFINES += HAVE_QT_MAC
unix:DEFINES += HAVE_QT_WAYLAND HAVE_QT_EGLFS HAVE_QT_EGLFS HAVE_QT_QPA_HEADER

versionAtLeast(QT_VERSION, "5.5"):win32-msvc: LIBS += opengl32.lib

INCLUDEPATH += /opt/V700/sysroots/aarch64-poky-linux/opt/Qt-5.15.2/include/QtGui/5.15.2/QtGui/

SOURCES += \
    gstplugin.cc \
    gstqtglutility.cc \
    gstqsgtexture.cc \
    gstqtsink.cc \
    gstqtsrc.cc \
    qtwindow.cc \
    qtitem.cc

HEADERS += \
    gstqsgtexture.h \
    gstqtgl.h \
    gstqtglutility.h \
    gstqtsink.h \
    gstqtsrc.h \
    qtwindow.h \
    qtitem.h
