import QtQuick 2.2

Item {
    id: root
    anchors.left: parent.left
    anchors.right: parent.right

    height: windowHeight * 0.1

    property alias text: textitem.text
    property alias text_bottom: bottom_text_item.text
    property int miscData : -1
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#fffbd9"
        visible: mouse.pressed
    }

    Column {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30

        Text
        {
            id: textitem
            font.bold: true
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Text
        {
            id: bottom_text_item
            visible: text !== ""
            wrapMode: Text.WordWrap
            width: parent.width
        }
    }

    Image {
        anchors.right: parent.right
        //anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/navigation_next_item.png"

        scale: 0.5
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
