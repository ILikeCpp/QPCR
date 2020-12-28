#include "basemessage.h"
#include <QDebug>

BaseMessage::BaseMessage()
{
    m_timeoutMSecs = 70000;
    m_startMseconds = 0;
    m_sender = nullptr;
}

BaseMessage::~BaseMessage()
{
    qDebug() << __FUNCTION__;
}

void BaseMessage::setData(QJsonObject data)
{
    m_data = data;
}

QJsonObject BaseMessage::getData()
{
    return m_data;
}

void BaseMessage::setMsgType(quint16 msgType)
{
    m_msgType = msgType;
}

quint16 BaseMessage::msgType()
{
    return m_msgType;
}

void BaseMessage::setTimeoutMSecs(const int msecs)
{
    m_timeoutMSecs = msecs;
}

int BaseMessage::timeoutMSecs() const
{
    return m_timeoutMSecs;
}

void BaseMessage::setStartMseconds(const int msecs)
{
    m_startMseconds = msecs;
}

int BaseMessage::startMseconds() const
{
    return m_startMseconds;
}

void BaseMessage::setSender(QObject *ptr)
{
    m_sender = ptr;
}

QObject *BaseMessage::getSender() const
{
    return m_sender;
}
