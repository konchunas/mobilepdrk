import QtQuick 2.0

import QtLocation 5.3

MapQuickItem
{
    id: root
    property string text
    sourceItem:
        Item
        {
            Rectangle
            {
                id: marker
                width: 14;
                height: 14;
                color: "#e41e25";
                border.width: 2;
                border.color: "white";
                smooth: true;
                radius: 7
            }
            Text
            {
                text: root.text
                anchors.left: marker.right
                wrapMode: Text.WordWrap
                width: marker.width * 5
            }
        }

    opacity: 1.0
    anchorPoint: Qt.point(marker.width/2, marker.height/2)
}
