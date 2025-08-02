import Quickshell
import Quickshell.Io
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

  Rectangle {
    id: bg
    color: "#1A1B1F"
    radius: 6
    anchors.leftMargin: -10
    anchors.rightMargin: -10
    anchors.topMargin: -6
    anchors.bottomMargin: -6
    z: -1
    anchors.fill: clock
  }

  Text {
    id: clock
    text: ""
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    color: "#DADBDD"
    font.pixelSize: 15
    font.family: "Monospace"
    font.weight: 500

    Process {
      id: dateProc
      command: ["date", "+%a - %d-%b - %H:%M:%S"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: clock.text = this.text
      }
    }

    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: dateProc.running = true
    }
  }
}
