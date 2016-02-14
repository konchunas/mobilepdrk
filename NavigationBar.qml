import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtLocation 5.3

ToolBar
{
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: rowLayout.height

    property string title

    RowLayout
    {
        id: rowLayout
        //anchors.centerIn: parent
        spacing: 5

        Button
        {
            id: backButton
            text: "Back"
            anchors.left: parent.left
            anchors.top: parent.top
            onClicked: pageStack.pop()
        }
    }


    Label
    {
        id: titleLabel
        color: "red"
        text: title
        anchors.centerIn: parent
    }
}
