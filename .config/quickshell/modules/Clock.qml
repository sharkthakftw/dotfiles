import QtQuick
import Quickshell.Io
import qs.config

Item {
  id: root
  width: 200
  height: 40

  ModuleBackground {}

  Text {
    id: clock
    text: ""
    anchors.centerIn: parent
    color: Appearance.fg
    font.pixelSize: Appearance.fontSize
    font.family: Appearance.fontFamily
    font.weight: Appearance.fontWeight

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
