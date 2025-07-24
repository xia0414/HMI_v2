import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Particles 2.12
import "./plugin"
Rectangle {
    id:root
    property real batteryLevel: 0.5
    property real borderWidth: 6
    property color borderColor:Config.accentColor
    property color nomalLevelColor: "#4CAF50"
    property color lowLevelColor: "#FFC107"
    property color lowerLevelColor: "red"

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
        border.color: borderColor // 设置边界线颜色
        border.width: borderWidth // 设置边界线宽度
        radius:10
        // 电量rect
        Rectangle {
            id:colorRectiud
            width: (batteryContainer.width - 2 * borderWidth)*(batteryLevel)
            height: batteryContainer.height - 2 * borderWidth
            anchors.verticalCenter: parent.verticalCenter
            x: borderWidth
            color: colorBasedOnValue(batteryLevel)
            radius:5
            // 电量颜色获取函数
            function colorBasedOnValue(value) {
                if (value < 0.1) {
                    return root.lowerLevelColor;
                } else if (value < 0.2) {
                    return root.lowLevelColor;
                } else {
                    return root.nomalLevelColor; // 默认值或其他颜色
                }
            }
        }
        // 电量文字
        Text {
            anchors.centerIn: parent
            text: Math.floor(batteryLevel * 100) + "%"
            font.pixelSize: 20
            color: "white"
        }
    }
    //电池头
    Rectangle {
        id: batteryHeader
        width: batteryContainer.width / 18
        height: batteryContainer.height / 2.5
        anchors.left:batteryContainer.right
        anchors.verticalCenter: batteryContainer.verticalCenter
        color: borderColor
        radius: 5
        Rectangle {
            x: 0
            y: 0
            width: parent.radius
            height: parent.height
            radius: 0
            color: parent.color
        }
    }

    ParticleSystem {
    id: particleSystem
    }

    Emitter {
    id: emitter
    system: particleSystem
    //anchors.centerIn: parent
    emitRate: 20
    lifeSpan: 1000
    size: 10
    endSize: 100
    anchors.left: parent.left
    anchors.leftMargin: 10
    anchors.verticalCenter: parent.verticalCenter

    //anchors.bottom: parent.bottom
            width: 1  // 线的宽度
            height: parent.height-20           // 线的高度（设为1表示一条水平线）
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
    width: 10
    height: 10
    radius: height/2
    color: "red"
    }
    }

}
