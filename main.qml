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

    property alias wannabePage: rectangle
    property alias pageStack: mainStackView

    StackView
    {
        id: mainStackView
        anchors.fill: parent
        initialItem : mapPage
        MapPage
        {
            id: mapPage
        }
        Rectangle
        {
            id: rectangle
            color: "blue";
        }
    }
}
