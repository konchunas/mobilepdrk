import QtQuick 2.0

import "qml_controls"

import "js/requester.js" as Requester


Page {
    caption: qsTr("Claims")

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.1
        color: "green"
    }

    ListModel {
        id: claims_model
        ListElement {
            title : "ABC"
        }
    }

    ListView {
        id: claims_list
        anchors.fill: parent
        model: claims_model

        delegate: AndoidListItem {
            text: title
        }
    }

    function onClaimsReceiveOk (json) {
        console.log("OK " + json)

        for (var i = 0; i < 5; i++)
            claims_model.append({"title": "TEST "+i})
    }

    function onClaimsReceiveError () {
        console.log("Claims: Error")
    }

    function initClaims() {
        Requester.request(
                    "http://test.acts.pp.ua:8000/api/v1/claims/",
                    onClaimsReceiveOk,
                    onClaimsReceiveError
        );
    }
}
