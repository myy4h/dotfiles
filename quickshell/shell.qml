import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts


PanelWindow {
    screen: Quickshell.screens.find(s => s.name === "HDMI-A-2")
id: root
    property color colBg: "#1a1b26"
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colCyan: "#0db9d7"
    property color colBlue: "#a970c1"
    property color colYellow: "#e0af68"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14


    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 25
    color: "#1a1b26"

    RowLayout {
	anchors.fill: parent
	anchors.margins: 2

	Repeater {
	    model: 10

	    Text {
		property var ws: Hyprland.workspace.values.find(w => w.id === index + 1)
		property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
		text: index + 1
		color: isActive ? "#a970c1" : (ws ? "#7aa2f7" : "#444b6a")
		font { pixelSize: 14; bold: true }

		MouseArea{
		    anchors.fill: parent
		    onClicked: Hyprland.dispatch("workspace" + (index + 1))
		}
	    }
	}

	Item { Layout.fillWidth: true }

	Text {
            id: clock
            color: root.colBlue
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
            text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            }
        }
    }
}
