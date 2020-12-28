#ifndef COM_INTERFACE_H
#define COM_INTERFACE_H
#include <QString>

#pragma pack(push, 1)
//发送帧
typedef struct __Send_Frame
{
    quint16		m_startTag;			// 起始位  0xeb90
    quint8		m_sequence;			// 序列号
    quint8		m_address_com:6;			// 设备地址 低6
    quint8		m_address_mac:2;			// 设备地址 高2

    quint8		m_cmd;				// 命令
    quint8		m_dat[4];	 		// 其他数据
    quint8		m_checkSum;			// 求和校验
}Send_Frame;


#pragma pack(pop)



#endif // COM_INTERFACE_H
