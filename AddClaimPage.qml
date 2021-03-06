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
    property string orgType

    property int claimType
    property string claimName

    Rectangle
    {
        anchors.fill: parent
    }

    function organizationPicked(org_id, org_name, org_type) {
        org_button.text_bottom = org_name;

        orgPicked = true
        orgId = org_id
        orgName = org_name
        orgType = org_type
    }

    function claimPicked(claimType, claimName) {
        claimButton.text_bottom = claimName;

        root.claimType = claimType
        root.claimName = claimName
        pageStack.pop();
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
            text_bottom: qsTr("Choose organization")
            onClicked: {
                var component = Qt.createComponent("Organizations.qml");
                var org_view = component.createObject(root, {});
                org_view.init(true, true)
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

        AndoidListItem
        {
            id: claimButton
            text_bottom: qsTr("Choose claim type")
            onClicked:
            {
                var component = Qt.createComponent("ClaimTypePage.qml");
                var claimTypePage = component.createObject(root, {});
                claimTypePage.init(orgType)
                claimTypePage.claimPicked.connect(claimPicked)
                pageStack.push({item:claimTypePage, destroyOnPop:true})
            }
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
                        "claim_type" : claimType // TODO: add other claim types
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
