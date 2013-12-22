How to integrate a map into your SailfishOS app
===============================================

Packages and friends
--------------------

In your PROJECT.yaml file, add the following packages. These will be auto-installed on device/emulator when you deploy as RPM package.
**Important: You must set your project to "Deploy as RPM package" in Project settings for this to work.**
*Don't forget to sync your target by going to "SailfishOS" sidebar item, choose your target, hit "Sync".*

In the "Requires"-section add:

    - qt5-plugin-geoservices-nokia
    - qt5-plugin-geoservices-osm
    - qt5-qtdeclarative-import-location
    - qt5-qtdeclarative-import-positioning
    - sailfishsilica-qt5

Your "PkgBR" should look like this:

    PkgBR: [qt5-qtlocation-devel, qt5-qtpositioning-devel, qt5-qtdeclarative-import-positioning]


You now have all the required packages to work with maps and location-based stuff.

Next step is to show a map!

QMLing it all up
----------------

First step is to include the right frameworks in your QML file:
    import QtPositioning 5.0
    import QtLocation 5.0

QTPositioning provides the ways to work with GPSes, while QTLocation gives us maps and everything around that.
Great documentation for QTLocation can be found (strangly enough) on Ubuntu Touch website: http://developer.ubuntu.com/api/qml/sdk-1.0/QtLocation/
QTPositioning docs can be found here: http://doc-snapshot.qt-project.org/qdoc/qtpositioning-index.html

Now we're ready to add a Map-element to your QML file.

        Map {
            id: map
            anchors.fill: parent
            plugin : Plugin {
                id: plugin
                allowExperimental: true
                preferred: ["nokia", "osm"]
                required.mapping: Plugin.AnyMappingFeatures
                required.geocoding: Plugin.AnyGeocodingFeatures
                parameters: [
                    PluginParameter { name: "app_id"; value: "YOUR_HERE_APP_ID" },
                    PluginParameter { name: "token"; value: "YOUR_HERE_TOKEN" }
                ]
            }

Map element in QT5 is very modular, and thus uses the term "plugin" to describe which mapping solution should be used in the map element.
I'm using Nokias HERE mapping solution in this tutorial, mostly 'cause I like it :)
According to docs, there's also possiblity to use OpenStreetMap plugin, I haven't tried it tho, so you're on your own there...

For Nokias HERE maps you'll need an app_id and a token. Those can be found at: http://developer.here.com/frontpage
You'll need to register as a developer, and don't worry, there's a free tier! (thx Nokia!)


TODO:
-----
* Location via GPS
* Map items
* etc

