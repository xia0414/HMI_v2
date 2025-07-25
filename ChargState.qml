import QtQuick 2.0
import QtQuick.Layouts 1.12
import "./plugin"
Rectangle
{
    id:root
    color:Config.cardColor
    property var loadState: [1,0,0]
    property var loadState2:[0,0]

    RowLayout
    {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        Rectangle
        {
            width: 20
            Rectangle
            {
                anchors.centerIn: parent
                width: 20
                height: 20
                radius: height/2
                border.width: 2
                border.color: Config.accentColor
                color: loadState[0]?  Config.accentColor:Config.cardColor
                Rectangle
                {
                    id:rect_1
                    anchors.centerIn:parent
                    width: 4
                    height: 4
                    radius: height/2
                    color:loadState[0]? Config.cardColor:Config.accentColor
                }
                Text {
                    anchors.top: rect_1.bottom
                    anchors.topMargin: 3
                    anchors.horizontalCenter: rect_1.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text:"插枪"
                    color: Config.accentColor
                }

            }

        }

        Canvas {
             Layout.fillWidth: true
            height: 2 // 如果是横线虚线，高度设为线宽
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset() // 清除之前绘制
                ctx.lineWidth = height // 设置线宽（这里用高度作为线宽）
                ctx.setLineDash([4, 4]) // 虚线模式：4px实线，4px空白（可调整）
                ctx.strokeStyle = loadState2[0]?Config.accentColor:Config.gray
                ctx.beginPath()
                ctx.moveTo(0, height/2) // 从中间开始（保证线宽对称）
                ctx.lineTo(width, height/2)
                ctx.stroke()
            }
        }
        Rectangle
        {
            width: 20
            Rectangle
            {
                anchors.centerIn: parent
                width: 20
                height: 20
                radius: height/2
                border.width: 2
                border.color: loadState2[0]? Config.accentColor:Config.gray
                color:  loadState[1]?  Config.accentColor:Config.cardColor
                Rectangle
                {
                    id:rect_2
                    anchors.centerIn:parent
                    width: 4
                    height: 4
                    radius: height/2
                    color:loadState2[0]?loadState[1]? Config.cardColor:Config.accentColor:Config.gray
                }
                Text {
                    anchors.top: rect_2.bottom
                    anchors.topMargin: 3
                    anchors.horizontalCenter: rect_2.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text:"充电"
                    color:loadState2[0]? Config.accentColor:Config.gray
                }
            }
        }
        Canvas {
            Layout.fillWidth: true
            height: 2 // 如果是横线虚线，高度设为线宽
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset() // 清除之前绘制
                ctx.lineWidth = height // 设置线宽（这里用高度作为线宽）
                ctx.setLineDash([4, 4]) // 虚线模式：4px实线，4px空白（可调整）
                ctx.strokeStyle =loadState2[1]?Config.accentColor:Config.gray
                ctx.beginPath()
                ctx.moveTo(0, height/2) // 从中间开始（保证线宽对称）
                ctx.lineTo(width, height/2)
                ctx.stroke()
            }
        }
        Rectangle
        {
            width: 20
            Rectangle
            {
                anchors.centerIn: parent
                width: 20
                height: 20
                radius: height/2
                border.width: 2
                border.color: loadState2[1]? Config.accentColor:Config.gray
                color: loadState[2]?  Config.accentColor:Config.cardColor
                Rectangle
                {
                    id:rect_3
                    anchors.centerIn:parent
                    width: 4
                    height: 4
                    radius: height/2
                    color:loadState2[1]?loadState[2]? Config.cardColor:Config.accentColor:Config.gray
                }
                Text {
                    anchors.top: rect_3.bottom
                    anchors.topMargin: 3
                    anchors.horizontalCenter: rect_3.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text:"结算"
                    color:loadState2[1]? Config.accentColor:Config.gray
                }
            }
        }
    }
}

