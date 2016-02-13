import QtQuick 2.0

Item
{
    property string text

    anchors.left: parent.left
    anchors.right: parent.right

    Rectangle
    {
        anchors.fill: parent
        color: "lightgray"
    }

    Text
    {
        text: parent.text
        color: "black"
        anchors.centerIn: parent
    }
}
