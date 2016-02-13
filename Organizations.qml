import QtQuick 2.0

import "qml_controls"

import "js/requester.js" as Requester


Page {
    caption: qsTr("Organizations")
    property string org_json_name: ""

    Rectangle {
        anchors.fill: parent
        color: "green"
    }

    ListModel {
        id: orgs_model
    }

    ListView {
        id: orgs_list
        anchors.fill: parent
        model: orgs_model

        delegate:AndoidListItem
        {
            text_bottom: title_bottom
            miscData: orgID

            onClicked:
            {
                claimsPage.init(orgID)
                pageStack.push(claimsPage)
            }
        }
    }

    function onOrgsReceiveOk (json)
    {
        console.log( JSON.stringify(json) )

        orgs_model.clear()

        for (var org in json)
        {
            if (json[org].total_claims === 0) //TODO: do not hide int add claim state
                continue

            console.log(JSON.stringify(json[org]))
            orgs_model.append({
                "title_bottom" : json[org].name,
                "orgID": json[org].id
            })
        }
    }

    function onOrgsReceiveError () {
        console.log("Organizations: Error")
    }

    function init() {
        var url = "http://192.168.1.180:8000/api/v1/organizations";
        Requester.request(url, onOrgsReceiveOk, onOrgsReceiveError);
    }
}
