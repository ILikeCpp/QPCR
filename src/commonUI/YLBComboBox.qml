import QtQuick 2.9
import QtQuick.Controls 2.2

ComboBox {
    id: comboBox
    width: 100*pixelRate;
    height: 100*pixelRate;
    font.pixelSize: 12*pixelRate;

    property bool showBorder: true;

    Component.onCompleted:
    {
        if(Qt.platform.os === "windows")
        {
            font.family = "MicroSoft YaHei";
        }
    }

    delegate: ItemDelegate {
        width: comboBox.width
        contentItem: Text {
            text: modelData
            font: comboBox.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter;
        }
        highlighted: comboBox.highlightedIndex === index;
    }

    contentItem: Text {
        text: comboBox.displayText
        font: comboBox.font
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter;
        elide: Text.ElideRight
    }

    background: Rectangle {
        anchors.fill: parent;
        border.width: showBorder? 1 : 0;
        border.color: enabled? "lightsteelblue" : "lightgray";
        color: comboBox.pressed && showBorder? "gray":"white";
        radius: showBorder? 10*pixelRate:0;
    }
}
