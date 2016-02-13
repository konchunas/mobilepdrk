import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
//import QtQuick.Com

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

    property alias wannabePage: rectangle
    property alias claimsPage: claimsPageView
    property alias pageStack: mainStackView

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
        MapPage
        {
            id: mapPage
        }
        Claims
        {
            id: claimsPageView
        }
        Rectangle
        {
            id: rectangle
            color: "blue";
        }
    }
}
