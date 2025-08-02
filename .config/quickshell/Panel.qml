import "modules"
import Quickshell
import QtQuick

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }
  color: "transparent"
  implicitHeight: 45
  implicitWidth: Screen.width

  Music {
    id: music
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 24
  }

  Clock {
    id: clock
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
  }

}
