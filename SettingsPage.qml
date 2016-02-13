import QtQuick 2.0
import "qml_controls"

Page
{
    caption: qsTr("Settings")

    Rectangle
    {
        anchors.fill: parent
        color: "lightblue"
    }

    ListModel
    {
        id: listModel
        ListElement
        {
            title : qsTr("Geolocation")
        }
        ListElement
        {
            title : qsTr("Language")
        }
    }

    ListView
    {
        id: listView
        anchors.fill: parent
        model: listModel
        interactive: false

        delegate: AndoidListItem
        {
            text: title
        }
    }
}
