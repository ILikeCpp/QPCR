#ifndef BASEPLOTITEM_H
#define BASEPLOTITEM_H

#include <QtQuick>
#include <QJsonArray>
#include <QJsonObject>

class QCustomPlot;
class QCPAbstractPlottable;

/**
 * @brief 图表Item基类
 */

class BasePlotItem : public QQuickPaintedItem
{
    Q_OBJECT
public:
    BasePlotItem( QQuickItem* parent = 0 );
    virtual ~BasePlotItem();
    void paint( QPainter* painter );

    QCustomPlot *getPlot();

protected:
    virtual void initCustomPlotUI(const QJsonArray array = QJsonArray()) { }

protected:

public slots:
    void onCustomReplot();
    void updateCustomPlotSize();

private:
    QCustomPlot* m_CustomPlot;
};

#endif // BASEPLOTITEM_H
