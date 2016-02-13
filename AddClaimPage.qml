import QtQuick 2.0
import QtQuick.Controls 1.4

import "qml_controls"
import "js/requester.js" as Requester

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
                onClicked:
                {
                    Requester.postRequest("http://192.168.1.180:8000/api/v1/claims/",
                                      onClaimsReceiveOk,
                                      onClaimsReceiveError,
                                      "{\"text\": \"hhhhh\", \"live\": false, \"organization\": 20, \"servant\": \"eeee\", \"claim_type\": 1 }")
                }


                function onClaimsReceiveOk (json)
                {
                    console.log("post is " + json.Responce)
                }

                function onClaimsReceiveError ()
                {
                    console.log("Claims: Error")
                }
            }
        }
    }


}
