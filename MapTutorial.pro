# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = MapTutorial

CONFIG += sailfishapp

SOURCES += src/MapTutorial.cpp

OTHER_FILES += qml/MapTutorial.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/MapTutorial.spec \
    rpm/MapTutorial.yaml \
    MapTutorial.desktop \
    qml/pages/HereIndicator.qml \
    qml/images/here-icon.png \
    qml/images/here-icon-gray.png

