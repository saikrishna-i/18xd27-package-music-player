QT       += core gui multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    musicfile.cpp \
    musiclist.cpp \
    musicqueue.cpp \
    playerdialog.cpp

HEADERS += \
    musicfile.h \
    musiclist.h \
    musicqueue.h \
    playerdialog.h

FORMS += \
    dialog.ui
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


#taglib stuff


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/include/taglib/lib/release/ -ltag
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/include/taglib/lib/debug/ -ltag
else:unix: LIBS += -L$$PWD/include/taglib/lib/ -ltag

INCLUDEPATH += $$PWD/include/taglib/include
DEPENDPATH += $$PWD/include/taglib/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/include/taglib/lib/release/libtag.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/include/taglib/lib/debug/libtag.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/include/taglib/lib/release/tag.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/include/taglib/lib/debug/tag.lib
else:unix: PRE_TARGETDEPS += $$PWD/include/taglib/lib/libtag.a
LIBS += -lz
