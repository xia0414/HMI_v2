import QtQuick 2.0
import QtQuick.Layouts 1.12
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
            spacing: 10
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
                height: parent.height
                width: height
                radius: height/2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5

                Text {
                    id:text_a
                    text: "A"
                    color: Config.textColor
                    font.pixelSize: 40
                    anchors.centerIn: parent
                    //horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    //anchors.left: parent.left
                   // anchors.leftMargin: 10
                }
                }
                FilledButton
                {
                    anchors.left:gun_id.right
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    height: 40
                    width: 60
                    text: "解锁"
                }
            }
            Rectangle
            {
                id:rect_2
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Config.cardColor
            QRCode
            {
                anchors.centerIn: parent
                size:Math.min(rect_2.height,rect_2.width)
                text: "kfc_vme_50"
                color: Config.textColor
                bgColor: Config.cardColor
            }
            }
            Rectangle
            {
                id:rect_3
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: Config.cardColor
                RowLayout
                {

                    anchors.fill: parent
                    anchors.leftMargin: 50
                    anchors.rightMargin: 50
                    spacing: 10
                    FilledButton
                    {

                        Layout.fillWidth: true
                        height: 60
                        text: "刷卡充电"
                        font.pixelSize: 20
                    }
                    FilledButton
                    {
                         Layout.fillWidth: true
                         height: 60
                         font.pixelSize: 20
                         text:"VIN充电"
                    }
                }
            }
            Rectangle
            {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                color: Config.cardColor
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

        }
    }
}
