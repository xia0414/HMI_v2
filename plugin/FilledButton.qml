import QtQuick 2.0
import QtQuick.Controls 2.12
Button {
    property bool disabled: false
    property string contentDescription: ""
    property color normalColor: "#1885E7"
    property color hoverColor: !Config.isLightTheme() ? Qt.darker(normalColor,1.1) : Qt.lighter(normalColor,1.1)
    property color disableColor: !Config.isLightTheme() ? Qt.rgba(82/255,82/255,82/255,1) : Qt.rgba(199/255,199/255,199/255,1)
    property color pressedColor: !Config.isLightTheme() ? Qt.darker(normalColor,1.2) : Qt.lighter(normalColor,1.2)
    property color textColor: {
        if(0){
            if(!enabled){
                return Qt.rgba(173/255,173/255,173/255,1)
            }
            return Qt.rgba(0,0,0,1)
        }else{
            return Qt.rgba(1,1,1,1)
        }
    }
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    id: control
    enabled: !disabled
    focusPolicy:Qt.TabFocus
    //font:FluTextStyle.Body

    verticalPadding: 0
    horizontalPadding:12
    background: ControlBackground{
        implicitWidth: 30
        implicitHeight: 30
        radius: parent.height/2
        bottomMargin: enabled ? 2 : 0
        border.width: enabled ? 1 : 0
        border.color: enabled ? Qt.darker(control.normalColor,1.2) : disableColor
        color:{
            if(!enabled){
                return disableColor
            }
            if(pressed){
                return pressedColor
            }
            return hovered ? hoverColor :normalColor
        }
    }
    contentItem: Text {
        text: control.text
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: control.textColor
        renderType:Text.QtRendering
    }
}
