import QtQuick 2.0
import "./plugin"
Rectangle
{
    id:root

    property var card_QRCode
    property var card_Charging
    property var card_fee
    property var source

    radius: 10
    border.color: Config.borderColor
    border.width: 2
    color: Config.cardColor

    Loader
    {
        id:card_loader
        anchors.fill: parent
        anchors.margins: 5

    }
    Component.onCompleted:
    {
        card_loader.source = source
    }

}
