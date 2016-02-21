import QtQuick 2.0
import QtQuick.Controls 1.3

import QtLocation 5.3
import QtPositioning 5.3

import "qml_controls"

import "js/requester.js" as Requester

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

        property real previousZoomLevel

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

        gesture.onPanFinished:
        {
            requestNearestMarkers()
            //distance of 100 is just a magic number here ^^^

        }

        onZoomLevelChanged:
        {
            var prevLevel = map.getNearestPolygonLevel(map.previousZoomLevel)
            var currentLevel = map.getNearestPolygonLevel(map.zoomLevel)

            if (prevLevel !== currentLevel)
            {
                map.requestNearestMarkers()
            }

            map.previousZoomLevel = map.zoomLevel
            console.log("zoom level is " + map.zoomLevel)
        }

        function requestNearestMarkers()
        {
            var currentLevel = getNearestPolygonLevel(map.zoomLevel)

            var centerCoordString = map.center.latitude + "," + map.center.longitude
            console.log("centerCoordString " + centerCoordString)
            Requester.request(
                        "http://test.acts.pp.ua:8000/api/v1/get_nearest_polygons/"+ currentLevel + "/100/" + centerCoordString,
                        onPolygonsReceiveOk,
                        onPolygonsReceiveError
            );
        }

        function getNearestPolygonLevel(zoomLevel)
        {
            if (zoomLevel < 12)
                return 3
            return 4
        }
    }

    function onPolygonsReceiveOk (json)
    {
        console.log(JSON.stringify(json))

        map.clearMapItems()
        for (var point in json)
        {
            var latitude = json[point].properties.centroid[0]
            var longitude = json[point].properties.centroid[1]
            //console.log("centroid at " + point + " " + latitude + "," + longitude)

            var organization = json[point].properties.organizations[0]

            var name = json[point].properties.ID
            //var name = organization.name
            //var orgId = organization.id

            var markerComponent = Qt.createComponent("qml_controls/OrganizationMarker.qml");
            if (markerComponent.status == Component.Ready)
            {
                var markerObject = markerComponent.createObject(map);
                map.addMapItem(markerObject)
                markerObject.coordinate = QtPositioning.coordinate(latitude, longitude)
                markerObject.text = name
                //markerObject.organizationId = orgId
            }
            else
            {
                console.log(markerComponent.errorString())
            }
        }
    }

    function onPolygonsReceiveError () {
        console.log("Claims: Error")
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
