import QtQuick 2.0

Text {
    property int iconSource
    property int iconSize: height
    property color iconColor:Config.textColor
    id:control
    font.family: font_loader.name
    font.pixelSize: iconSize
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: iconColor
    text: (String.fromCharCode(iconSource).toString(16))
    FontLoader{
        id: font_loader
        source: "qrc:/src/font/FluentIcons.ttf"
    }
}
