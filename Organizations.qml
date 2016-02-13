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
            //text: title
            text_bottom: title_bottom
            miscData: orgID

            onClicked:
            {
                claimsPage.init(orgID)
                pageStack.push(claimsPage)
            }
        }
    }

    function onOrgsReceiveOk (json) {
        console.log("Super : " + json[org_json_name].address )

        orgs_model.clear()

        var childs = json[org_json_name].childs
        for (var item in childs)
        {
            console.log("")
            console.log("Property: " + item)

            console.log("")
            if (typeof childs[item].address !== "undefined") {
                var addr = childs[item].address;
                console.log("Addr: " + addr);

                console.log("")
                for (var org in childs[item].orgs) {
                    console.log("Org: " + org);
                    orgs_model.append({
                        "title" : org,
                        "title_bottom" : addr,
                        "orgID": org
                    })
                }
            }

        }
    }

    function onOrgsReceiveError () {
        console.log("Organizations: Error")
    }

    function init(org_level_name) {
        org_json_name = org_level_name || "root";
        var url = "http://test.acts.pp.ua:8000/api/v1/get_polygons_tree/" + org_json_name + "/";
        Requester.request(url, onOrgsReceiveOk, onOrgsReceiveError);
    }
}
