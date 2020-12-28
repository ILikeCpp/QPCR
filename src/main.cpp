#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "common.h"
#include "QCustomplot/customhistogramitem.h"

int main(int argc, char *argv[])
{
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    CustomHistogramItem::registerQMLType();

#if 1
    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    if(nullptr != context)
    {
        context->setContextProperty("pixelRate",pixelRate());
    }

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
#endif

    return app.exec();
}
