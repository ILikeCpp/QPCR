#ifndef CUSTOMHISTOGRAMITEM_H
#define CUSTOMHISTOGRAMITEM_H

#include "baseplotitem.h"

class QCPBars;

/**
 * @brief 自定义直方图Item
 */

class CustomHistogramItem : public BasePlotItem
{
    Q_OBJECT

public:
    CustomHistogramItem( QQuickItem* parent = nullptr );
    virtual ~CustomHistogramItem();

    static void registerQMLType();

protected:
    Q_INVOKABLE virtual void initCustomPlot(const QJsonArray array = QJsonArray(), const QString type = "");
};

#endif // CUSTOMHISTOGRAMITEM_H
