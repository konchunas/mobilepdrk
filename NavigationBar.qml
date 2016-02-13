import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtLocation 5.3

ToolBar
{
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: parent.height * 0.1

    RowLayout
    {
        //anchors.centerIn: parent
        spacing: 5

        Button
        {
            id: backButton
            text: "Back"
            onClicked: pageStack.pop()
        }

        Label
        {
            id: titleLabel
            color: "red"
            text: title
        }
    }
}
