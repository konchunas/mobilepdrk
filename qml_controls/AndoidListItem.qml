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
        color: "#11ffffff"
        visible: mouse.pressed
    }

    Column {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30

        Text
        {
            id: textitem
            font.bold: true
            //wrapMode: Text.WrapAnywhere
            //elide: Text.ElideMiddle
        }

        Text
        {
            id: bottom_text_item
            //color: "lightgray"
            visible: text !== ""
            wrapMode: Text.WrapAnywhere
        }
    }

    /*Image {
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/navigation_next_item.png"
    }*/

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
