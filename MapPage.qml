import QtQuick 2.0
import QtQuick.Controls 1.3

import QtLocation 5.3

import "qml_controls"

Page
{
    caption: "Map"

    Plugin
    {
        id: osmPlugin
        preferred: ["osm"]
        PluginParameter { name: "osm.useragent"; value: "My great Qt OSM application" }
        PluginParameter { name: "osm.mapping.host"; value: "http://osm.tile.server.address/" }
        PluginParameter { name: "osm.mapping.copyright"; value: "All mine" }
        PluginParameter { name: "osm.routing.host"; value: "http://osrm.server.address/viaroute" }
        PluginParameter { name: "osm.geocoding.host"; value: "http://geocoding.server.address" }
    }

    Map
    {
        id: map

        plugin: osmPlugin

        anchors.fill: parent

        center {
            latitude: 50.00777117005465
            longitude: 36.25434728238018
        }
        zoomLevel: 14.0

        gesture.enabled: true
        gesture.activeGestures: MapGestureArea.ZoomGesture | MapGestureArea.PanGesture

        MouseArea
        {
            anchors.fill: parent
        }
    }

    Button
    {
        id: add_claim_button
        text: qsTr("Add claim")
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: parent.height * 0.1
        onClicked: pageStack.push(addClaimPage)
    }

    Button
    {
        id: get_claims
        text: qsTr("Get claims")
        anchors.bottom: add_claim_button.top
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked:
        {
            claimsPage.init()
            pageStack.push(claimsPage)
        }
    }

    Button
    {
        //style: PdrkButtonStyle {}
        text: qsTr("Get organizations")
        anchors.bottom: get_claims.top
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked:
        {
            organizationsPage.init(false)
            pageStack.push(organizationsPage)
        }
    }

}
