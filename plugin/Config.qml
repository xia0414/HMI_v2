pragma Singleton
import QtQuick 2.0

Item {
    id: theme
    property real fontScale: 1
    property color backgroundColor: "#F6F6F6"
    property color titleBarColor: "#ECECEC"
    property color cardColor: "#FFFFFF"
    property color textColor: "#3C485C"
    property color borderColor: "#D4D4D4"
    property color btnColor: "#F2F2F2"
    property color btnPressedColor: "#E3E3E3"
    property color accentColor: "#1885E7"
    property string themeState: state

    function isLightTheme() {
        return state === "lightTheme"
    }

    function setTheme(themeName) {
        if (themeName === "lightTheme" || themeName === "blackTheme") {
            state = themeName
            themeChanged(state)
        } else {
            console.error("Invalid theme name:", themeName)
        }
    }

    function setBlackTheme() {
        setTheme("blackTheme")
    }

    function setlightTheme() {
        setTheme("lightTheme")
    }

    signal themeChanged(var state)

    states: [
        State {
            name: "lightTheme"
            PropertyChanges {
                target: theme
                backgroundColor: "#F6F6F6"
                titleBarColor: "#ECECEC"
                cardColor: "#FFFFFF"
                textColor: "#3C485C"
                borderColor: "#D4D4D4"
                btnColor: "#F2F2F2"
                btnPressedColor: "#E3E3E3"
            }
        },
        State {
            name: "blackTheme"
            PropertyChanges {
                target: theme
                backgroundColor: "#2D2D2D"
                titleBarColor: "#383838"
                cardColor: "#323846"
                textColor: "#C5C5C5"
                borderColor: "#4D5464"
                btnColor: "#2D2D2D"
                btnPressedColor: "#1D1D1D"
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "*"
            ParallelAnimation {
                NumberAnimation { target: theme; property: "backgroundColor"; duration: 300; easing.type: Easing.InOutQuad }
                NumberAnimation { target: theme; property: "cardColor"; duration: 300; easing.type: Easing.InOutQuad }
                NumberAnimation { target: theme; property: "textColor"; duration: 300; easing.type: Easing.InOutQuad }
                NumberAnimation { target: theme; property: "titleBarColor"; duration: 300; easing.type: Easing.InOutQuad }
                NumberAnimation { target: theme; property: "borderColor"; duration: 300; easing.type: Easing.InOutQuad }
                NumberAnimation { target: theme; property: "btnColor"; duration: 300; easing.type: Easing.InOutQuad }
                //NumberAnimation { target: theme; property: "btnPressedColor"; duration: 300; easing.type: Easing.InOutQuad }
            }
        }
    ]

    Component.onCompleted: {
        state = "lightTheme"
    }
}
