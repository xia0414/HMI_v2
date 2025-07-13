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
                color:"#00000000"
                Row
                {
                    anchors.fill: parent

                    Image {
                        height: parent.height-5
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.bottomMargin: 3
                        //anchors.bottomMargin: 3
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/src/img/logo_hici_white.svg"

                    }

                    FontIcon
                    {
                        iconSource: IconTypes.GlobalNavButton
                        anchors.verticalCenter: parent.verticalCenter

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
                    anchors.margins: 20
                    Rectangle
                    {
                        Layout.preferredHeight: parent.height
                        Layout.fillWidth: true
                        radius: 10
                        border.color: Config.borderColor
                        border.width: 2
                        color: Config.cardColor
                        FilledButton
                        {
                            anchors.centerIn: parent
                            text: "扫码充电"
                        }
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
        //Config.setBlackTheme();
    }

}
