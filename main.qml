import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import IconTypes 1.0
import "./plugin"
ApplicationWindow
{
    visible: true
    width: 800
    height: 480
    title: qsTr("HMI_V2")
    Rectangle
    {
        anchors.fill:parent
        color: "#000000"
        Rectangle
        {
            anchors.fill: parent
            radius: 10
            color: Config.accentColor
            Rectangle
            {

                anchors.top: parent.top
                anchors.bottom: content_rect.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                height: 25
                color:"#00000000"

                Image {
                    height: parent.height-5
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.bottomMargin: 0
                    //anchors.bottomMargin: 3
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/src/img/logo_hici_white.svg"
                }
                Text {
                    id: timeText
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 10
                    font.pixelSize: 24
                    color:"white"
                    Component.onCompleted: {
                         timeText.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
                    }
                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered:
                        {
                             timeText.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
                        }
                    }
                }
                IconButton
                {
                    id:singal_btn
                    anchors.right: timeText.left
                    anchors.verticalCenter: parent.verticalCenter
                    iconSize: 25
                    iconColor: "white"
                    iconSource:IconTypes.Wifi
                }
                IconButton
                {
                    id:theme_btn
                    anchors.right: singal_btn.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    iconSize: 25
                    iconColor: "white"
                    iconSource:Config.isLightTheme? IconTypes.QuietHours:IconTypes.Brightness
                    onClicked:
                    {
                        if(Config.isLightTheme)
                        {
                            Config.setBlackTheme()
                        }
                        else
                        {
                            Config.setlightTheme()
                        }
                    }
                }

            }

            Rectangle
            {
                id:content_rect
                anchors.fill: parent
                anchors.topMargin: 40
                radius: 10
                color: Config.backgroundColor
                RowLayout
                {
                    anchors.fill: parent
                    spacing: 20
                    anchors.margins: 30
                    SwithCard
                    {
                        Layout.preferredHeight: parent.height
                        Layout.fillWidth: true
                    }

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height
                        Layout.fillWidth: true
                        radius: 10
                        border.color: Config.borderColor
                        border.width: 2
                        color: Config.cardColor
                    }
                }

            }
        }
    }
    Component.onCompleted:
    {
        Config.setlightTheme()
    }

}
