import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "./plugin"
import IconTypes 1.0
Item {
    id:root
    anchors.fill: parent
    Rectangle
    {
        id:rect_1
        anchors.fill: parent
        color: Config.cardColor
        ColumnLayout
        {
            anchors.fill: parent
            spacing: 0
            Rectangle
            {

                Layout.preferredHeight: 50
                Layout.fillWidth: true
                color: Config.cardColor
                Rectangle
                {
                id:gun_id
                border.color: Config.textColor
                color: "#00000000"
                border.width: 3
                height: parent.height-10
                width: height
                radius: height/2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5

                Text {
                    id:text_a
                    text: "B"
                    color: Config.textColor
                    font.pixelSize: 30
                    anchors.centerIn: parent
                    //horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    //anchors.left: parent.left
                   // anchors.leftMargin: 10
                }
                }

                IconButton
                {
                    anchors.left:gun_id.right
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    display: Button.TextBesideIcon
                    text: "解锁"
                    textColor: "white"
                    iconColor: "white"
                    iconSource: IconTypes.Unlock
                }
            }
            Rectangle
            {
                id:rect_2
                Layout.preferredHeight: 180
                Layout.preferredWidth: 180
                border.width: 3
                border.color: Config.accentColor
                radius: 20
                Layout.alignment: Qt.AlignHCenter
                color: Config.cardColor
                Rectangle
                {
                    anchors.horizontalCenter: rect_2.horizontalCenter
                    anchors.verticalCenter: rect_2.top
                    height: 20
                    width: 90
                    color: Config.cardColor
                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 20
                        text: "扫码充电"
                        font.bold: true
                        color: Config.textColor
                    }
                }
            QRCode
            {
                anchors.centerIn: parent
                //anchors.margins: 10
                size:Math.min(rect_2.height-40,rect_2.width-40)
                text: "kfc_vme_50"
                color: Config.textColor
                bgColor: Config.cardColor
            }
            }
            Rectangle
            {
                id:rect_3
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                color: Config.cardColor
                RowLayout
                {

                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    spacing: 0
                    IconButton
                    {
                        Layout.preferredHeight: 50
                        Layout.preferredWidth: 120
                         Layout.alignment: Qt.AlignHCenter

                        iconSize: 30
                        display: Button.TextBesideIcon
                        text: "刷卡充电"
                        textColor: "white"
                        iconColor: "white"
                        iconSource: IconTypes.Smartcard
                    }

                    IconButton
                    {
                        Layout.preferredHeight: 50
                        Layout.preferredWidth: 120
                         Layout.alignment: Qt.AlignHCenter
                        iconSize: 25
                        display: Button.TextBesideIcon
                        text: "VIN充电"
                        textColor: "white"
                        iconColor: "white"
                        iconSource: IconTypes.Car
                    }
                }
            }

            ChargState
            {
                Layout.preferredHeight: 50
                Layout.fillWidth:true
                //anchors.leftMargin: 20
                //anchors.rightMargin: 20
                //border.color:"black"
                //border.width: 2
            }

        }

        IconButton
        {
            id:more_btn
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 5
            anchors.topMargin: -5
            iconSource:IconTypes.More
            iconSize: 30
            iconColor: Config.textColor
            isTranspraent: true

        }
    }
}
