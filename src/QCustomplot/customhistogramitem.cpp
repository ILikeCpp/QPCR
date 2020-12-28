#include "customhistogramitem.h"
#include "QCustomplot/qcustomplot.h"
#include "qqml.h"
#include "common.h"

CustomHistogramItem::CustomHistogramItem( QQuickItem* parent ) : BasePlotItem( parent )
{
    getPlot()->xAxis->ticker()->setTickCount(10);
    getPlot()->yAxis->ticker()->setTickCount(6);

    getPlot()->rescaleAxes();
    getPlot()->xAxis->setRange(0,45);
    getPlot()->yAxis->setRange(0,5000);
}

CustomHistogramItem::~CustomHistogramItem()
{

}

void CustomHistogramItem::registerQMLType()
{
    qmlRegisterType<CustomHistogramItem>(ELAB_QML_PACKAGE, ELAB_QML_MAJOR_VER, ELAB_QML_MINOR_VER, "CustomHistogramItem");
}

void CustomHistogramItem::initCustomPlot(const QJsonArray array, const QString type)
{
    if(array.isEmpty()) {
        return;
    }

    updateCustomPlotSize();
}
