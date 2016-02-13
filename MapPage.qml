import QtQuick 2.0
import QtQuick.Controls 1.4

import QtLocation 5.3

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
            latitude: -27
            longitude: 153
        }
        zoomLevel: 8.0

        gesture.enabled: true
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
        onClicked: {
            claimsPage.init()
            pageStack.push(claimsPage)
        }
    }

    Button
    {
        text: qsTr("Get organizations")
        anchors.bottom: get_claims.top
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            organizationsPage.init("21citkyivs")
            pageStack.push(organizationsPage)
        }
    }

}
