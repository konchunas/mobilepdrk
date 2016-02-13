import QtQuick 2.0
import QtQuick.Controls 1.4

import QtLocation 5.3

Item
{
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
        zoomLevel: map.minimumZoomLevel

        gesture.enabled: true
    }

    Rectangle
    {
        id: searchBarBackground
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.1
        //anchors.fill: parent
        color: "black"
    }

    Button
    {
        text: "Add claim"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: parent.height * 0.1
        onClicked: pageStack.push(wannabePage)
    }
}
