import QtQuick 2.0

import "qml_controls"

import "js/requester.js" as Requester


Page {
    caption: qsTr("Claims")

    Rectangle {
        anchors.fill: parent
        //color: "green"
    }

    ListModel {
        id: claims_model
    }

    ListView {
        id: claims_list
        anchors.fill: parent
        model: claims_model

        delegate: AndoidListItem {
            text: title
            text_bottom: title_bottom
        }
    }

    function onClaimsReceiveOk (json) {
        var len = json.length
        console.log("Received " + len + " claims.")

        claims_model.clear()
        for (var i = 0; i < len; i++) {
            claims_model.append({
                "title" : json[i].servant,
                "title_bottom" : json[i].text
            })
        }
    }

    function onClaimsReceiveError () {
        console.log("Claims: Error")
    }

    function init(orgID) {
        var orgIDStr = orgID === undefined ? "" : "?organization__id=" + orgID;
        Requester.request(
                    "http://test.acts.pp.ua:8000/api/v1/claims/" + orgIDStr,
                    onClaimsReceiveOk,
                    onClaimsReceiveError
        );
    }
}
