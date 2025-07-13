#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qrcodeitem.h"
#include "Def.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    qmlRegisterType<QRCodeItem>("QRCodeItem", 1, 0, "QRCodeItem");
    qmlRegisterUncreatableType<IconTypes>(
                "IconTypes", 1, 0, "IconTypes",
                "Cannot instantiate IconTypes"
            );
    engine.load(url);




    return app.exec();
}
