TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp

RESOURCES +=

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    Claims.qml \
    main.qml \
    MapPage.qml \
    js/requester.js \
    NavigationBar.qml \
    Page.qml \
    SearchBar.qml \
    qml_controls/AndoidListItem.qml \
    SettingsPage.qml \
    qml_controls/FullWidthLabel.qml \
    AddClaimPage.qml \
    qml_controls/FullWidthTextInput.qml \
    Organizations.qml \
    qml_controls/PdrkButtonStyle.qml
