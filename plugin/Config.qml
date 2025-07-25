pragma Singleton
import QtQuick 2.0

Item {
    id:theme
    property bool  isLightTheme:theme.state === "lightTheme"? true:false
    property real fontScale: 1
    property color backgroundColor: "#F6F6F6"
    property color titleBarColor: "#ECECEC"
    property color cardColor: "#FFFFFF"
    property color textColor: "#3C485C"
    property color borderColor: "#D4D4D4"
    property color btnColor: "#F2F2F2"
    property color btnPressedColor: "#E3E3E3"
    property color accentColor: "#1885E7"
    property color gray:"#ADADAD"
    property color green:"#1BD7A0"
    property string themeState: state

    function setBlackTheme()
    {
        theme.state = "blackTheme"
        themeChanged(theme.state)
    }
    function setlightTheme()
    {
        theme.state = "lightTheme"
        themeChanged(theme.state)
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
                //btnColor: "#F2F2F2"
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
                textColor: "#FFFFFF"
                borderColor: "#4D5464"
                //btnColor: "#2D2D2D"
                btnPressedColor: "#1D1D1D"
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "*"
                PropertyAnimation { target: theme; property: "backgroundColor"; duration: 200}
                PropertyAnimation { target: theme; property: "cardColor"; duration: 200}
                PropertyAnimation { target: theme; property: "textColor"; duration: 200}
                PropertyAnimation { target: theme; property: "titleBarColor"; duration: 200}
                PropertyAnimation { target: theme; property: "borderColor"; duration: 200 }
            }
    ]

    Component.onCompleted: {
        state = "lightTheme"
    }
}
