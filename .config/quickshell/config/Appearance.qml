pragma Singleton
import QtQuick

QtObject {

  // Colors
  property color bg: "#1a1b1f"
  property color lightbg: "#2a2b2f"
  property color grey: "#7f8083"
  property color fg: "#dadbdd"
  property color red: "#d04a3b"
  property color pink: "#c75465"
  property color blue: "#4993c6"
  property color violet: "#8f63cc"

  // Font
  property string fontFamily: "JetBrainsMono Nerd Font"
  property int fontSize: 15
  property int fontSizeBig: 18
  property int fontWeight: 500

  property int borderRadius: 8
  property int borderWidth: 0
  property color borderColor: pink
}
