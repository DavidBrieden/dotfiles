import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "#1a1b26"

    Text {
        anchors.centerIn: parent
        text: "Meine erste Bar"
        color: "#a9b1d6"
        font.pixelSize: 14
    }
}
