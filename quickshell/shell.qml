import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root
    screen: Quickshell.screens.find(s => s.name === "HDMI-A-2")
    property color colBg: "#1a1b26"
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colCyan: "#0db9d7"
    property color colBlue: "#a970c1"
    property color colYellow: "#e0af68"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    anchors.bottom: true
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
                font {
                    pixelSize: 14
                    bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace" + (index + 1))
                }
            }
        }

        Rectangle {
            property var ws: Hyprland.workspaces.values.find(w => w.name === "game")
            width: 19
            height: 19
            radius: 2
            visible: ws !== undefined          // remove this line to always show it
            color: Hyprland.focusedWorkspace?.name === "game" ? "#a970c1" : "#585b70"
            Text {
                anchors.centerIn: parent
                text: "g"
                color: "white"
                font {
                    pixelSize: 12
                    bold: true
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace name:game")
            }
        }
        Rectangle {
            property var ws: Hyprland.workspaces.values.find(w => w.name === "dev")
            width: 19
            height: 19
            radius: 2
            visible: ws !== undefined          // remove this line to always show it
            color: Hyprland.focusedWorkspace?.name === "dev" ? "#a970c1" : "#585b70"
            Text {
                anchors.centerIn: parent
                text: "d"
                color: "white"
                font {
                    pixelSize: 12
                    bold: true
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace name:dev")
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: clock
            color: root.colBlue
            font {
                family: root.fontFamily
                pixelSize: root.fontSize
                bold: true
            }
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
