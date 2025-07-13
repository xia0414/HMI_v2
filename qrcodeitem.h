#ifndef QRCODEITEM_H
#define QRCODEITEM_H

#include <QObject>
#include <QQuickPaintedItem>
#include "stdafx.h"

class QRCodeItem : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY_AUTO(QString,text)
    Q_PROPERTY_AUTO(QColor,color)
    Q_PROPERTY_AUTO(QColor,bgColor)
    Q_PROPERTY_AUTO(int,size);
public:
     explicit QRCodeItem(QQuickItem *parent = nullptr);
     void paint(QPainter* painter) override;


};

#endif // QRCODEITEM_H
