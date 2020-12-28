#ifndef BASEMESSAGE_H
#define BASEMESSAGE_H

#include <QObject>
#include <QJsonObject>

/**
 * @brief 各模块消息基类
 */

class BaseMessage
{
public:
    explicit BaseMessage();
    virtual ~BaseMessage();
    virtual quint16 type() = 0;

    /**
     * @brief 消息中包含的数据
     * @param obj
     */
    void setData(QJsonObject data);
    QJsonObject getData();

    /**
     * @brief 消息的类型
     * @param type
     */
    void setMsgType(quint16 msgType);
    quint16 msgType();

    /**
     * @brief 超时时限
     * @param msecs
     */
    void setTimeoutMSecs(const int msecs);
    int timeoutMSecs() const;

    /**
     * @brief 开始时间
     * @param msecs
     */
    void setStartMseconds(const int msecs);
    int startMseconds()const;

    /**
     * @brief 消息发送者
     * @param ptr
     */
    void setSender(QObject * ptr);
    QObject *getSender() const;

protected:
    QJsonObject m_data;
    quint16 m_msgType;
    int m_timeoutMSecs;
    int m_startMseconds;
    QObject *m_sender;
};

#endif // BASEMESSAGE_H
