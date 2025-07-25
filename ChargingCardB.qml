import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "./plugin"
import IconTypes 1.0
Item {
    id:root
    anchors.fill: parent
    property var batteryLevel
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

                Text
                {
                    id:text_ischarging
                    text: "充电中"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                    font.bold: true
                    color:Config.green

                }

            }

            Rectangle
            {

             Layout.fillHeight: true
             Layout.fillWidth: true
             color: "#00000000"
             BatteryCharging
             {
                 id:battery
                 anchors.top: parent.top
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.topMargin: 10
                 batteryLevel: 0.39
             }

             GridLayout
             {
                 anchors.left: parent.left
                 anchors.right: parent.right
                 anchors.bottom: stop_charge.top
                 anchors.top: battery.bottom
                 anchors.leftMargin: 20
                 anchors.rightMargin: 20
                 columns: 2
                 rows: 2
                 Rectangle
                 {
                     Layout.fillHeight: true
                     Layout.fillWidth: true
                     color: "#00000000"
                     Text {
                        id:title_1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "充电功率"
                        font.pixelSize: 15
                        //font.bold: true
                        color: Config.accentColor
                     }
                     Text {
                        anchors.top: title_1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "150KW"
                        font.pixelSize: 20
                        font.bold: true
                        color: Config.textColor
                     }
                 }
                 Rectangle
                 {
                     Layout.fillHeight: true
                     Layout.fillWidth: true
                     color: "#00000000"
                     Text {
                        id:title_2
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "已充金额"
                        font.pixelSize: 15
                       // font.bold: true
                        color: Config.accentColor
                     }
                     Text {
                        anchors.top: title_2.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "10.2元"
                        font.pixelSize: 20
                        font.bold: true
                        color: Config.textColor
                     }
                 }
                 Rectangle
                 {
                     Layout.fillHeight: true
                     Layout.fillWidth: true
                     color: "#00000000"
                     Text {
                        id:title_3
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "已充电量"
                        font.pixelSize: 15
                        //font.bold: true
                        color: Config.accentColor
                     }
                     Text {
                        anchors.top: title_3.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "10.2KW/H"
                        font.pixelSize: 20
                        font.bold: true
                        color: Config.textColor
                     }
                 }

                 Rectangle
                 {
                     Layout.fillHeight: true
                     Layout.fillWidth: true
                     color: "#00000000"
                     Text {
                        id:title_4
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "剩余时间"
                        font.pixelSize: 15
                       // font.bold: true
                        color: Config.accentColor
                     }
                     Text {
                        anchors.top: title_4.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "35min"
                        font.pixelSize: 20
                        font.bold: true
                        color: Config.textColor
                     }
                 }
             }

             IconButton
             {
                 id:stop_charge
                 anchors.bottom: parent.bottom
                 anchors.horizontalCenter: parent.horizontalCenter
                 width: parent.width-100
                 //height: 45

                 //iconSize: 30
                 display: Button.TextOnly
                 font.pixelSize: 20
                 font.bold: true
                 text: "停止充电"
                 textColor: "white"
                 iconColor: "white"
                 //iconSource: IconTypes.Stop
             }



            }

            ChargState
            {
                id:charge_state
                loadState: [0,1,0]
                loadState2: [1,0]
                Layout.preferredHeight: 50
                Layout.fillWidth:true
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
