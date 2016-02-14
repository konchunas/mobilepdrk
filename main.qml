import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

import "qml_controls"

ApplicationWindow
{
    id: applicationWindow

    property alias windowHeight: applicationWindow.height
    property alias windowWidth: applicationWindow.width
    property int fontSize: width / 15
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
    property alias dialogAddClaimOK: dialog_add_claim_ok

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
    SettingsPage
    {
        id: settingsPage
    }

    StackView
    {
        id: mainStackView
        anchors.fill: parent
        initialItem :
            MapPage
            {
                id: mapPage
            }

        Keys.onReleased: if (event.key === Qt.Key_Back)
                         {
                             mainStackView.pop();
                             event.accepted = true;
                         }

    }

    CustomDialog {
        id: dialog_add_claim_ok
    }
}
