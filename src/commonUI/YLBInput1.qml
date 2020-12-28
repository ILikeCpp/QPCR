import QtQuick 2.9

Rectangle {
    id:inputRect
    width: 100*pixelRate;
    height: 100*pixelRate;
    border.width: 1;
    border.color: enabled? "lightsteelblue" : "lightgray";
    clip: true;
    radius: 10*pixelRate;

    property alias text: input.text;
    property alias textColor: input.color;
    property bool fullScreenMode: false;

    TextInput {
        id:input
        width: parent.width - 15*pixelRate;
        anchors.centerIn: parent;
        verticalAlignment: Text.AlignVCenter;
        selectByMouse: true;

        onFocusChanged: {
            if(focus) {
                if(fullScreenMode) {
                    if(root_SettingMgr.openSoftKeyboard) {
                        root_com.fullScreenMode = true;
                    }else{
                        root_com.fullScreenMode = false;
                    }
                }else{
                    root_com.fullScreenMode = false;
                }
            }
        }

        Component.onCompleted:
        {
            if(Qt.platform.os === "windows")
            {
                font.family = "MicroSoft YaHei";
            }
        }
    }
}
