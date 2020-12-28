import QtQuick 2.9

Text {
    font.pixelSize: 12*pixelRate;

    Component.onCompleted:
    {
        if(Qt.platform.os === "windows")
        {
            font.family = "MicroSoft YaHei";
        }
    }
}
