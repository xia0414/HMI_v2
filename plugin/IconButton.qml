import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Button {
    display: Button.IconOnly
    property int iconSize: 20
    property int iconSource
    property bool disabled: false
    property int radius:4
    property string contentDescription: ""
    property color hoverColor: "#00000050"
    property color pressedColor:  !Config.isLightTheme? Qt.darker(normalColor,1.1) : Qt.lighter(normalColor,1.1)
    property color normalColor: "#00000000"
    property color disableColor: "#00000000"
    property Component iconDelegate: com_icon
    property color color: {
        if(!enabled){
            return disableColor
        }
        if(pressed){
            return pressedColor
        }
        return hovered ? hoverColor : normalColor
    }
    property color iconColor
    property color textColor
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    id:control
    focusPolicy:Qt.TabFocus
    padding: 0
    verticalPadding: 8
    horizontalPadding: 8
    enabled: !disabled
    //font:FluTextStyle.Caption
    background: Rectangle{
        implicitWidth: 30
        implicitHeight: 30
        radius: control.radius
        color:control.color
    }
    Component{
        id:com_icon
        FontIcon {
            id:text_icon
            font.pixelSize: iconSize
            iconSize: control.iconSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            iconColor: control.iconColor
            iconSource: control.iconSource
        }
    }
    Component{
        id:com_row
        RowLayout{
            Loader{
                sourceComponent: iconDelegate
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.TextOnly
            }
            Text{
                text:control.text
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.IconOnly
                color: control.textColor
                font: control.font
            }
        }
    }
    Component{
        id:com_column
        ColumnLayout{
            Loader{
                sourceComponent: iconDelegate
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.TextOnly
            }
            Text{
                text:control.text
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                visible: display !== Button.IconOnly
                color: control.textColor
                font: control.font
            }
        }
    }
    contentItem:Loader{
        sourceComponent: {
            if(display === Button.TextUnderIcon){
                return com_column
            }
            return com_row
        }
    }
}
