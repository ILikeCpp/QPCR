#ifndef COMMON_H
#define COMMON_H

#include <QScreen>
#include <QGuiApplication>
#include <QFont>
#include <QDebug>
#include <QUuid>

/**
 * @brief 屏幕适配
 * @return
 */
inline float pixelRate()
{
    QScreen *screen = QGuiApplication::primaryScreen();

    QFont appFont = QGuiApplication::font();
    int pixelSize = 12;
    if(appFont.pixelSize() > 0)
    {
        pixelSize = appFont.pixelSize();
    }
    else if(appFont.pointSize() > 0)
    {
        pixelSize = (appFont.pointSize() * screen->logicalDotsPerInch()) / 72;
    }

    return pixelSize/12.0;
}

// 注册的qml包名
#ifndef ELAB_QML_PACKAGE
#define ELAB_QML_PACKAGE "ELABSysPackage"
#endif

// QML主版本号
#ifndef ELAB_QML_MAJOR_VER
#define ELAB_QML_MAJOR_VER    1
#endif

// QML小版本号
#ifndef ELAB_QML_MINOR_VER
#define ELAB_QML_MINOR_VER    0
#endif


// 软件主版本号
#ifndef NS_MAJOR_VER
#define NS_MAJOR_VER    "1"
#endif

// 软件小版本号
#ifndef NS_MINOR_VER
#define NS_MINOR_VER    "0"
#endif


#endif // COMMON_H
