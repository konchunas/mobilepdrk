import QtQuick 2.0
import QtQuick.Controls 1.3

import "qml_controls"
import "js/requester.js" as Requester

Page
{
    id: root
    caption: qsTr("Add claim")

    property bool orgPicked: false // TODO: use this for test before send
    property int orgId
    property string orgName

    Rectangle
    {
        anchors.fill: parent
        color: "purple"
    }

    function organizationPicked(org_id, org_name) {
        org_button.text = org_name;

        orgPicked = true
        orgId = org_id
        orgName = org_name
    }

    Column
    {
        anchors.fill: parent
        FullWidthLabel
        {
            text: qsTr("Name of organization")
            height: parent.height * 0.1
        }

        AndoidListItem {
            id: org_button
            text: qsTr("Choose organization")
            onClicked: {
                var component = Qt.createComponent("Organizations.qml"); // TODO: bad code, refactor !!!
                var org_view = component.createObject(root, {});
                org_view.init(true)
                org_view.organizationPicked.connect(organizationPicked)
                pageStack.push({item:org_view, destroyOnPop:true})
            }
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
                    var obj = {
                        "text" : claimText.text,
                        "live" : false,
                        "organization" : orgId,
                        "servant" : servantTextInput.text,
                        "claim_type" : 1 // TODO: add other claim types
                    }
                    var json_str = JSON.stringify(obj)
                    Requester.postRequest("http://test.acts.pp.ua:8000/api/v1/claims/",
                                      onClaimsReceiveOk,
                                      onClaimsReceiveError,
                                      json_str)
                }

                function onClaimsReceiveOk (json)
                {
                    console.log("post is " + json.Responce)
                    dialogAddClaimOK.show(qsTr("Sent"), qsTr("Your claim was succesfuly sent."))
                    mainStackView.pop()
                }

                function onClaimsReceiveError ()
                {
                    console.log("Claims: Error")
                }
            }
        }
    }

}
