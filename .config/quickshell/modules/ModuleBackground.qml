import QtQuick
import qs.config

Rectangle {
    color: Appearance.bg
    radius: Appearance.borderRadius
    anchors.fill: parent
    anchors.topMargin: 4
    anchors.bottomMargin: 4
    anchors.leftMargin: -15
    anchors.rightMargin: -15
    z: -1
    border.width: Appearance.borderWidth
    border.color: Appearance.borderColor
}
