import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtLocation 5.3

ToolBar
{
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: rowLayout.height

    Row
    {
        id: rowLayout
        //anchors.centerIn: parent
        //spacing: 3
        TextField
        {
            id: searchBox
            placeholderText: qsTr("Search for organizations...")
        }

        Button
        {
            id: loginButton
            text: "U"
        }

        Button
        {
            id: settingsButton
            text: "S"
            onClicked: mainStackView.push(settingsPage)
        }

    }
}
