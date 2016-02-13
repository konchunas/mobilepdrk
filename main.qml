import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

import "qml_controls"

ApplicationWindow
{
    visible: true
    width: 270
    height: 480
    title: qsTr("PDRK")

    toolBar: mainStackView.currentItem.caption === "Map" ? searchBar : navigationBar

    NavigationBar
    {
        id: navigationBar
        title: mainStackView.currentItem.caption
        visible: mainStackView.currentItem.caption !== "Map"
    }

    SearchBar
    {
        id: searchBar
        visible: mainStackView.currentItem.caption === "Map"
    }

    property alias claimsPage: claimsPageView
    property alias organizationsPage: organizationssPageView
    property alias pageStack: mainStackView
    property alias settingsPage: settingsPage
    property alias addClaimPage: addClaimPage

    StackView
    {
        id: mainStackView
        anchors.fill: parent
        initialItem : mapPage

        Keys.onReleased: if (event.key === Qt.Key_Back)
                         {
                             mainStackView.pop();
                             event.accepted = true;
                         }
        SettingsPage
        {
            id: settingsPage
        }
        MapPage
        {
            id: mapPage
        }
        Claims
        {
            id: claimsPageView
        }
        AddClaimPage
        {
            id: addClaimPage
        }
        Organizations
        {
            id: organizationssPageView
        }
        Rectangle
        {
            id: rectangle
            color: "blue";
        }
    }

    property alias pdrkButtonStyle: pdrkButtonStyle

    PdrkButtonStyle
    {
        id: pdrkButtonStyle
    }
}
