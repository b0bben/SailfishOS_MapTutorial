import QtQuick 2.0
import QtLocation 5.0

MapQuickItem {
    id: marker
    anchorPoint.x: image.width/4
    anchorPoint.y: image.height
    sourceItem:
    Image {

        id: image

        property bool blinking: true

        source: blinking ? "../images/here-icon-gray.png" : "../images/here-icon.png";
        smooth: true

        onBlinkingChanged: {
            if (!blinking) {
                visible = true;
            }
        }

        // Timer for blinking the location indicator until the current position
        // is found.
        Timer {
            id: mapImageBlinkingTimer
            interval: 500
            running: image.blinking
            repeat: true
            onTriggered: image.visible = !image.visible;
        }
    }
}
