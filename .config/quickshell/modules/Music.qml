import QtQuick
import Quickshell.Io
import qs.config

Item {
  id: root
  height: 40

  ModuleBackground {}

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
        font.pixelSize: Appearance.fontSizeBig
        color: Appearance.fg
      }
    }

    Text {
      id: songText
      text: "..."
      font.pixelSize: Appearance.fontSize
      font.family: Appearance.fontFamily
      font.weight: Appearance.fontWeight
      color: Appearance.fg
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
