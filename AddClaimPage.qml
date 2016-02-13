import QtQuick 2.0
import QtQuick.Controls 1.4

import "qml_controls"

Page
{
    id: root
    caption: qsTr("Add claim")

    Rectangle
    {
        anchors.fill: parent
        color: "purple"
    }

    Column
    {
        anchors.fill: parent
        FullWidthLabel
        {
            text: qsTr("Name of organization")
            height: parent.height * 0.1
        }

        FullWidthTextInput
        {
            id: organizationTextInput
            height: parent.height * 0.1
        }

        FullWidthLabel
        {
            text: qsTr("Name of the servant")
            height: parent.height * 0.1
        }

        FullWidthTextInput
        {
            id: servantTextInput
            height: parent.height * 0.1
        }

        FullWidthLabel
        {
            text: qsTr("Type of claim")
            height: parent.height * 0.1
        }

        FullWidthTextInput
        {
            id: claimTextInput
            height: parent.height * 0.1
        }

        FullWidthLabel
        {
            text: qsTr("Claim text")
            height: parent.height * 0.1
        }

        FullWidthTextInput
        {
            id: claimText
            height: parent.height * 0.1
        }

        Rectangle
        {
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.2
            color: "orange"

            Button
            {
                anchors.centerIn: parent
                text: qsTr("Send claim")
                //onClicked:
            }
        }
    }
}
