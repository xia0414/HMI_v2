import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Particles 2.12
import IconTypes 1.0
//import QtGraphicalEffects 1.12
import "./plugin"
Rectangle {
    id:root
    property real batteryLevel: 0.8
    property real borderWidth: 2
    property color borderColor:Config.backgroundColor
    property color nomalLevelColor: batteryLevel>0.4? "#1BD7A0" :"#FFC107"
    property color lowLevelColor: "#FFC107"
    property color lowerLevelColor: "red"


    property color baseColor: "#4CAF50"

    color: "#00000000"

    width: 200
    height: 100


    // 电池体
    Rectangle {
        id: batteryContainer
        width: parent.width - 2 * borderWidth
        height: parent.height - 2 * borderWidth
        anchors.centerIn: parent
        color: borderColor
        border.color: Config.borderColor
        border.width: 2 // 设置边界线宽度

        radius:10
        // 电量rect
        Rectangle {
            id:colorRectiud
            width: (batteryContainer.width - 2 * 8)*(batteryLevel)
            height: batteryContainer.height - 2 * 8
            anchors.verticalCenter: parent.verticalCenter
            x: 8
            color: nomalLevelColor
            radius:5
            // 电量颜色获取函数


            }

        DropShadow {
               anchors.fill: colorRectiud
               source:colorRectiud
               horizontalOffset: 0
               verticalOffset: 0
               radius: 10
               samples: 16
               color:  Qt.lighter(nomalLevelColor, 1.1)
           }

        ParticleSystem {
        id: particleSystem
        }

        Emitter {
        id: emitter
        system: particleSystem
        //anchors.centerIn: parent
        emitRate: 30
        lifeSpan: 1000*batteryLevel
        size: 10
        endSize: 1000
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter

        //anchors.bottom: parent.bottom
                width: 1  // 线的宽度
                height: parent.height-30           // 线的高度（设为1表示一条水平线）
                // 使用LineShape，可以指定起始点和终点，但通常我们使用Emitter的宽度和高度定义一条水平线或垂直线
                shape: LineShape {
                }

        velocity: AngleDirection {
                   angle: 0 // 角度（0为向右）
                   magnitude: 100 // 速度大小
                   angleVariation: 0 // 角度变化范围（0-360度随机）
                   magnitudeVariation: 50 // 速度变化范围
               }

               // 加速度（模拟重力或风力）
               acceleration: PointDirection {
                   x: 100
                   y: 0
                   xVariation: 20
                   yVariation: 0
               }
        }
        ItemParticle {
        system: particleSystem
        delegate: Rectangle {
        width: Math.random() * 7 + 5
        height: width
        radius: height/2
        color: batteryLevel>0.4? Qt.lighter(nomalLevelColor, 1.2): Qt.lighter(nomalLevelColor, 1.5)
        }
        }
        // 电量文字
        Text {
            id:text_1
            anchors.centerIn: parent
            text: Math.floor(batteryLevel * 100) + "%"
            font.pixelSize: 30
            font.bold:true
            color: "white"
        }
        Image {
            anchors.right: text_1.left
            anchors.rightMargin: -10
            anchors.verticalCenter: text_1.verticalCenter
            source: "qrc:/src/img/charging.svg" // 图片路径
            width: 40
            height: 40
        }
        Glow {
                anchors.fill: text_1
                source: text_1
                radius: 2
                samples: 10
                color: nomalLevelColor
                spread: 1
            }
//        FontIcon
//        {
//            anchors.right: text_1.left
//            anchors.verticalCenter: text_1.VerticalFit
//            iconSource:
//        }
    }
    //电池头
    Rectangle {
        id: batteryHeader
        z:-1
        width: 20
        height: batteryContainer.height / 2.5
        anchors.left:batteryContainer.right
        anchors.verticalCenter: batteryContainer.verticalCenter
        anchors.leftMargin: -10
        color: borderColor
        border.color: Config.borderColor
        border.width: 2
        radius: 5

    }




}
