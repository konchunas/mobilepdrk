#include <QApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
#ifdef ANDROID
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
#else
    engine.load(QUrl(QStringLiteral("../mobilepdrk/main.qml")));
#endif

    return app.exec();
}
