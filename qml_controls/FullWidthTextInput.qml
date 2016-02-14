import QtQuick 2.0

Item
{
    anchors.left: parent.left
    anchors.right: parent.right

    property alias text: text_input.text

    Rectangle
    {
        anchors.fill: parent
        color: "white"
    }

    TextInput
    {
        id: text_input
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
