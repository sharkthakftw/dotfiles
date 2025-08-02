import QtQuick
import Quickshell.Io

Item {
  id: root
  height: 40

  Rectangle {
    id: bg
    z: -1
    radius: 8
    color: "#1a1b1f"
    anchors.fill: parent
    anchors.topMargin: 4
    anchors.bottomMargin: 4
    anchors.leftMargin: -15
    anchors.rightMargin: -15
  }

  Row {
    id: row
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    spacing: 10

    MouseArea {
      onClicked: toggleProc.running = true
      Text {
        anchors.fill: parent
//        text: " "
        font.pixelSize: 18
        color: "#dadbdd"
      }
    }

    Text {
      id: songText
      text: "..."
      font.pixelSize: 15
      font.family: "Monospace"
      font.weight: 500
      color: "#dadbdd"
      elide: Text.ElideNone
      wrapMode: Text.NoWrap
    }

    Timer {
      interval: 1000
      repeat: true
      running: true
      onTriggered: metadataProc.running = true
    }

    Process {
      id: metadataProc
      command: ["playerctl", "--player=spotify", "metadata", "--format", "{{title}} - {{artist}}"]
      stdout: StdioCollector {
        onStreamFinished: songText.text = this.text || "No music"
      }
    }

    Process {
      id: toggleProc
      command: ["playerctl", "--player=spotify", "play-pause"]
    }
  }

  // Auto-resize based on content
  width: row.implicitWidth
}
