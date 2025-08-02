import "../Theme.qml" as Theme
import QtQuick
import Quickshell.Io

Item {
  id: root
  width: 200
  height: 40

  Rectangle {
    id: bg
    color: "#1a1b1f"
    radius: 8
    anchors.fill: parent
    anchors.topMargin: 4
    anchors.bottomMargin: 4
    anchors.leftMargin: -15
    anchors.rightMargin: -15
    z: -1
  }

  Text {
    id: clock
    text: ""
    anchors.centerIn: parent
    color: "#dadbdd"
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
