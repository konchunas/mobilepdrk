import QtQuick 2.0

import "qml_controls"

import "js/requester.js" as Requester


Page {
    caption: qsTr("Organizations")
    property string org_json_name: ""

    property bool returnOnOrgClick: false
    property bool showAllItems: false

    signal organizationPicked(int org_id, string org_name, string org_type)

    Rectangle {
        anchors.fill: parent
        //color: "green"
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
                organizationPicked(orgID, orgName, orgType)
                if (!returnOnOrgClick) { // TODO: refactor this
                    pageStack.push(claimsPage)
                } else {
                    pageStack.pop()
                }
            }
        }
    }

    function onOrgsReceiveOk (json)
    {
        console.log( JSON.stringify(json) )

        orgs_model.clear()

        for (var org in json)
        {
            if (!showAllItems)
                if (json[org].total_claims === 0) //TODO: do not hide int add claim state
                    continue

            console.log(JSON.stringify(json[org]))
            orgs_model.append({
                "title_bottom" : json[org].name,
                "orgID" : json[org].id,
                "orgName" : json[org].name,
                "orgType" : json[org].org_type
             })
        }
    }

    function onOrgsReceiveError () {
        console.log("Organizations: Error")
    }

    function init(return_on_org_click, show_all_items) {
        var url = "http://test.acts.pp.ua:8000/api/v1/organizations"

        Requester.request(url, onOrgsReceiveOk, onOrgsReceiveError)
        returnOnOrgClick = return_on_org_click
        showAllItems = show_all_items || showAllItems
    }
}
