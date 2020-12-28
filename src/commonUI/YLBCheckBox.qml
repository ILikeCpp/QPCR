import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

CheckBox {
    id: control;

    style: CheckBoxStyle {
        label: Text {
            color: "#0AA198";
            text: control.text
        }
        indicator:Image {
            sourceSize: Qt.size(30 * pixelRate, 30 * pixelRate);
            source: control.checked ? "qrc:/image/image/login/checked.png" : "qrc:/image/image/login/unchecked.png";
        }
    }
}
