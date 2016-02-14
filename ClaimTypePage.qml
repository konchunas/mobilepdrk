import QtQuick 2.0

import "qml_controls"

import "js/requester.js" as Requester


Page {
    caption: qsTr("Claim type")

    signal claimPicked(int claimID, string claimName)

    Rectangle {
        anchors.fill: parent
    }

    ListModel {
        id: typesModel
    }

    ListView {
        id: typesView
        anchors.fill: parent
        model: typesModel

        delegate: AndoidListItem
        {
            text_bottom: title

            onClicked:
            {
                claimPicked(id, title)
            }
        }
    }

    function onClaimTypesReceiveOk (json)
    {
        console.log( JSON.stringify(json) )

        typesModel.clear()

        for (var org in json)
        {
            typesModel.append({
                "title" : json[org].name,
                "id": json[org].id
            })
        }
    }

    function onClaimTypesReceiveError ()
    {
        console.log("Organizations: Error")
    }

    function init(orgType)
    {
        console.log("orgType" + orgType)
        var url = "http://test.acts.pp.ua:8000/api/v1/claim_types/?org_type__type_id=" + orgType

        Requester.request(url, onClaimTypesReceiveOk, onClaimTypesReceiveError)
    }
}
