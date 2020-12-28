#include "baseplotitem.h"
#include "QCustomplot/qcustomplot.h"

BasePlotItem::BasePlotItem( QQuickItem* parent ) : QQuickPaintedItem( parent ),
    m_CustomPlot(new QCustomPlot)
{
    setFlag( QQuickItem::ItemHasContents, true );

    connect(this, &QQuickPaintedItem::widthChanged, this, &BasePlotItem::updateCustomPlotSize);
    connect(this, &QQuickPaintedItem::heightChanged, this, &BasePlotItem::updateCustomPlotSize);
}

BasePlotItem::~BasePlotItem()
{
    delete m_CustomPlot;
    m_CustomPlot = nullptr;
}

void BasePlotItem::paint( QPainter* painter )
{
    if (nullptr != m_CustomPlot)
    {
        QPixmap picture(boundingRect().size().toSize());
        QCPPainter qcpPainter(&picture);

        m_CustomPlot->toPainter(&qcpPainter);

        painter->drawPixmap(QPoint(), picture);
    }
}

QCustomPlot *BasePlotItem::getPlot()
{
    if(nullptr == m_CustomPlot){
        m_CustomPlot = new QCustomPlot;
    }
    return m_CustomPlot;
}

void BasePlotItem::updateCustomPlotSize()
{
    if (nullptr != m_CustomPlot)
    {
        m_CustomPlot->setGeometry(0, 0, (int)width(), (int)height());
        m_CustomPlot->setViewport(QRect(0, 0, (int)width(), (int)height()));
    }
}

void BasePlotItem::onCustomReplot()
{
    update();
}
